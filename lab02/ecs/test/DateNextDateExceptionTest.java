import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

class DateNextDateExceptionTest {

    static Stream<Arguments> provideInvalidDates() {
        return Stream.of(
                Arguments.of(2020, 15, 1), // Mois > 12
                Arguments.of(2020, -1, 1), // Mois négatif
                Arguments.of(2020, 5, 32), // Jour > 31
                Arguments.of(2020, 4, 31), // 31 avril (avril = 30 jours max)
                Arguments.of(2021, 2, 29) // 29 février sur une année non bissextile
        );
    }

    @ParameterizedTest
    @MethodSource("provideInvalidDates")
    void testNextDateException(int year, int month, int day) {
        assertThrows(IllegalArgumentException.class, () -> {
            new Date(year, month, day);
        });
    }
}