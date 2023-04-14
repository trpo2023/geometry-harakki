#include <ctest.h>

CTEST(StartUp, CheckOutput)
{
    // Проверяем наличие вывода программы
    
    ASSERT_NOT_EQUAL(0, geometry());
}
