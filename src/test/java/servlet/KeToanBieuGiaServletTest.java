package servlet;

import dao.BieuGiaDichVuDAO;
import entity.BieuGiaDichVu;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.contains;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class KeToanBieuGiaServletTest {

    @Mock
    private BieuGiaDichVuDAO bieuGiaDAO;

    @Mock
    private HttpServletRequest req;

    @Mock
    private HttpServletResponse resp;

    @InjectMocks
    private KeToanBieuGiaServlet servlet;

    // 1. @ParameterizedTest + @CsvSource: Kiem tra bien Form luu bieu gia dich vu
    @ParameterizedTest(name = "Case {index}: loai={0}, donGia={2}, ngay={3} -> expect={4}")
    @CsvSource({
        "'PhiQuanLy', '0', '15000', '2026-12-01', '/chungcu/ketoan/bieu-gia?msg='",   // Hop le
        "'PhiQuanLy', '0', '-5000', '2026-12-01', '/chungcu/ketoan/bieu-gia?error='", // Bien: Don gia am
        "'PhiQuanLy', '0', 'abc', '2026-12-01', '/chungcu/ketoan/bieu-gia?error='",   // Bien: Don gia sai dinh dang
        "'PhiQuanLy', '0', '15000', '2026-99-99', '/chungcu/ketoan/bieu-gia?error='"  // Bien: Ngay hieu luc khong ton tai
    })
    void testXuLyLuu_ValidateFormBoundaries(String loaiDichVu, String bacTu, String donGia, String hieuLucTu, String expectedRedirect) throws Exception {
        when(req.getContextPath()).thenReturn("/chungcu");
        when(req.getRequestURI()).thenReturn("/chungcu/ketoan/bieu-gia/them");
        when(req.getParameter("id")).thenReturn("");
        when(req.getParameter("loaiDichVu")).thenReturn(loaiDichVu);
        when(req.getParameter("bacTu")).thenReturn(bacTu);
        when(req.getParameter("bacDen")).thenReturn("");
        when(req.getParameter("donGia")).thenReturn(donGia);
        when(req.getParameter("hieuLucTu")).thenReturn(hieuLucTu);
        when(req.getParameter("nguonGia")).thenReturn("BanQuanLy");

        lenient().when(bieuGiaDAO.saveOrUpdate(any(BieuGiaDichVu.class))).thenAnswer(invocation -> {
            BieuGiaDichVu bg = invocation.getArgument(0);
            if (bg.getDonGia().doubleValue() <= 0) {
                return "Don gia phai lon hon 0";
            }
            return null;
        });

        servlet.doPost(req, resp);

        verify(resp).sendRedirect(contains(expectedRedirect));
    }

    // 2. Quy tac nghiep vu: Chan xoa bieu gia Dien / Nuoc cua Nha nuoc
    @Test
    void testXuLyXoa_BieuGiaDien_ChanXoaTheoQuyDinh() throws Exception {
        when(req.getContextPath()).thenReturn("/chungcu");
        when(req.getRequestURI()).thenReturn("/chungcu/ketoan/bieu-gia/xoa");
        when(req.getParameter("id")).thenReturn("5");

        BieuGiaDichVu bieuGiaDien = new BieuGiaDichVu();
        bieuGiaDien.setLoaiDichVu("Dien");
        when(bieuGiaDAO.findById(5)).thenReturn(bieuGiaDien);

        servlet.doPost(req, resp);

        verify(resp).sendRedirect(contains("/chungcu/ketoan/bieu-gia?error="));
        verify(bieuGiaDAO, never()).deleteBieuGia(anyInt());
    }

    // 3. assertThrows(): Kiem thu ngoai le nghiep vu khi xoa bieu gia dang rang buoc hoa don
    @Test
    void testXuLyXoa_BieuGiaDangSuDung_ThrowsIllegalStateException() {
        when(req.getRequestURI()).thenReturn("/chungcu/ketoan/bieu-gia/xoa");
        when(req.getParameter("id")).thenReturn("8");

        BieuGiaDichVu bieuGiaGuiXe = new BieuGiaDichVu();
        bieuGiaGuiXe.setLoaiDichVu("GuiXe");
        when(bieuGiaDAO.findById(8)).thenReturn(bieuGiaGuiXe);
        when(bieuGiaDAO.deleteBieuGia(8))
                .thenThrow(new IllegalStateException("Khong the xoa bieu gia dang ap dung cho hoa don cu dan"));

        assertThrows(IllegalStateException.class, () -> servlet.doPost(req, resp));
    }
}