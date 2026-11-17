package servlet;

import dao.CanHoDAO;
import entity.CanHo;
import entity.CuDan;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.contains;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class BQLCanHoUpdateServletTest {

    @Mock
    private CanHoDAO canHoDAO;

    @Mock
    private HttpServletRequest req;

    @Mock
    private HttpServletResponse resp;

    @InjectMocks
    private BQLCanHoUpdateServlet servlet;

    // 1. @ParameterizedTest + @CsvSource: Kiem tra bien Form cap nhat can ho
    @ParameterizedTest(name = "Case {index}: id={0}, dienTich={1}, trangThai={2} -> expect={3}")
    @CsvSource({
        "'', '55.0', 'DangO', '/chungcu/banquanly/so-do'",              // Bien: ID rong
        "'1', '0', 'DangO', '/chungcu/banquanly/so-do?error='",         // Bien: Dien tich = 0
        "'1', '-25.5', 'DangO', '/chungcu/banquanly/so-do?error='",     // Bien: Dien tich am
        "'1', '60.0', 'SaiTrangThai', '/chungcu/banquanly/so-do?error='",// Bien: Trang thai khong hop le
        "'abc', '60.0', 'DangO', '/chungcu/banquanly/so-do?error='"     // Bien: ID sai dinh dang so
    })
    void testDoPost_ValidateFormBoundaries(String id, String dienTich, String trangThai, String expectedRedirectPrefix) throws Exception {
        when(req.getContextPath()).thenReturn("/chungcu");
        when(req.getParameter("id")).thenReturn(id);
        when(req.getParameter("dienTich")).thenReturn(dienTich);
        when(req.getParameter("trangThai")).thenReturn(trangThai);

        servlet.doPost(req, resp);

        verify(resp).sendRedirect(contains(expectedRedirectPrefix));
    }

    // 2. Test quy tac nghiep vu: Can ho dang co cu dan khong duoc chuyen sang BaoTri / TrongChoThue
    @Test
    void testDoPost_CanHoCoCuDan_KhongDuocDoiTrangThai() throws Exception {
        when(req.getContextPath()).thenReturn("/chungcu");
        when(req.getParameter("id")).thenReturn("10");
        when(req.getParameter("dienTich")).thenReturn("75.0");
        when(req.getParameter("trangThai")).thenReturn("BaoTri");

        CanHo canHo = new CanHo();
        when(canHoDAO.findById(10)).thenReturn(canHo);
        when(canHoDAO.findCuDanDangO(10)).thenReturn(List.of(new CuDan()));

        servlet.doPost(req, resp);

        verify(resp).sendRedirect(contains("/chungcu/banquanly/so-do?error="));
        verify(canHoDAO, never()).updateCanHo(any());
    }

    // 3. assertThrows(): Kiem thu ngoai le bat loi nghiep vu
    @Test
    void testDoPost_ViPhamNghiepVuDAO_ThrowsIllegalArgumentException() {
        when(req.getParameter("id")).thenReturn("10");
        when(req.getParameter("dienTich")).thenReturn("75.0");
        when(req.getParameter("trangThai")).thenReturn("DangO");

        when(canHoDAO.findById(10)).thenReturn(new CanHo());
        when(canHoDAO.findCuDanDangO(10)).thenReturn(Collections.emptyList());
        when(canHoDAO.updateCanHo(any(CanHo.class)))
                .thenThrow(new IllegalArgumentException("Vi pham rang buoc nghiep vu cap nhat can ho"));

        assertThrows(IllegalArgumentException.class, () -> servlet.doPost(req, resp));
    }

    @Test
    void testDoPost_NullRequest_ThrowsNullPointerException() {
        assertThrows(NullPointerException.class, () -> servlet.doPost(null, resp));
    }
}