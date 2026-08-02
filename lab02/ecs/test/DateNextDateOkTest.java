import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

class DateNextDateOkTest {

    static Stream<Arguments> provideDatesForNextDate() {
        return Stream.of(
                Arguments.of(new Date(2020, 5, 3), new Date(2020, 5, 4)), // Jour normal
                Arguments.of(new Date(2020, 5, 31), new Date(2020, 6, 1)), // Fin de mois de 31 jours
                Arguments.of(new Date(2020, 4, 30), new Date(2020, 5, 1)), // Fin de mois de 30 jours
                Arguments.of(new Date(2020, 12, 31), new Date(2021, 1, 1)), // Fin d'année
                Arguments.of(new Date(2020, 2, 28), new Date(2020, 2, 29)), // Année bissextile (2020)
                Arguments.of(new Date(2021, 2, 28), new Date(2021, 3, 1)) // Année non bissextile (2021)
        );
    }

    @ParameterizedTest
    @MethodSource("provideDatesForNextDate")
    void testNextDate(Date inputDate, Date expectedNextDate) {
        assertEquals(expectedNextDate, inputDate.nextDate());
    }
}