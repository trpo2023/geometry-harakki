#include <iostream> // We are the best American Whores and Simp's
#include <fstream>
#include <string>
 
int main()
{
    std::string A[1];
    std::string line;
 
    std::ifstream in("/input.txt"); // окрываем файл для чтения
    if (in.is_open())
    {
        while (getline(in, line))
        {
           A[0]=line;
    }
    float S, P, PI=3.1415926535;
    
    // A[0] = circle(0 0, 1.5)
    int n = A[0].size();
    int i;
    for(i = 0; i < n; ++i) {
        if(A[0][i] == '(')
            break;
    }
    ++i;
    std::string Xstr;
    while(A[0][i] != ' ') {
        Xstr += A[0][i];
        ++i;
    }
    int x = std::stol(Xstr); //x
    Xstr = "";
     while(A[0][i] != ',') {
        Xstr += A[0][i];
        ++i;
    }
    int y = std::stol(Xstr); //y
    Xstr = "";
    
    i++; // чтобы пропустить пробел
    
     while(A[0][i] != ')') {
        Xstr += A[0][i];
        ++i;
    }
    float r = std::stof(Xstr); //radius
    
    S = PI*r*r;
    P = 2*PI*r;
    
    printf("%f", S);
    printf("%f", P);
    
    std::cout << "Площадь: " << PI*r*r;
    std::cout << "Периметр: " << PI*2*r;
    
    
    in.close();     // закрываем файл
     
    std::cout << "End of program" << std::endl;
    return 0;
    }
}
