import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class TicTest {
    @Test
    void testSize_boardDe3x3_retourne9() {
        Tic board = new Tic(3, 3);
        assertEquals(9, board.size());
    }
}