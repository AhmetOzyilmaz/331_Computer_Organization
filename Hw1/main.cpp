#include <iostream>
#include <cstring>

using namespace std;
int IsDigit(char t);
int CheckOperator(char t);
double ADD();
double SUB();
double MULT();
void DoCalculation(char * a)
{
	int number1Decimal= 0 ;
	int number1Float = 0;
	int number2Decimal = 0;
	int number2Float = 0;
	int number1IsPozitif = 0;
	int number2IsPositif = 0;
	int number1DecimalSize = 0;
	int number1FloatSize = 0;
	int number2DecimalSize = 0;
	int number2FloatSize = 0;

	int resultDecimal = 0;
	int resultFloat = 0;
	int resultDecimalSize = 0;
	int resultFloatSize = 0;

	int size = strlen(a);
	int control = 0;

	control = IsDigit(a[0]);

	if (control == 0)
		number1IsPozitif = 1; //number1 < 0;
	else {
		number1Decimal = a[0] - 48;
		++number1DecimalSize;
	}
	int i = 1;
	for (i = 1; i < size; ++i) {
		control = IsDigit(a[i]);
		if (control == 1)
		{
			number1Decimal *= 10;
			number1Decimal += a[1] - 48 ;
			++number1DecimalSize;
		}
		else 
			break;
	}
	++i; // noktayý geçtik 

	//cout << a[i] << endl;

	for (; i < size; ++i) {
		control = IsDigit(a[i]);
		if (control == 1)
		{
			number1Float *= 10;
			number1Float += a[i] - 48;
			++number1FloatSize;
		}
		else
			break;
	}


	++i; //boþluk
	char k = a[i]; // hangi opertor olduðunu sakla 
	++i;//boþluk
	++i;

	control = IsDigit(a[i]);

	if (control == 0)
		number2IsPositif = 1; //number2 < 0;
	else {
		number2Decimal = a[i] - 48;
		++number2DecimalSize;
	}
	++i;
	for (; i < size; ++i) {
		control = IsDigit(a[i]);
		if (control == 1)
		{
			number2Decimal *= 10;
			number2Decimal += a[i] - 48;
			++number2DecimalSize;

		}
		else
			break;
	}
	++i; // noktayý geçtik 

	for (; i < size; ++i) {
		control = IsDigit(a[i]);
		if (control == 1){
			number2Float *= 10;
			number2Float += a[i] - 48;
			++number2FloatSize;
		}
		else
			break;
	}

	control = CheckOperator(k);
	double result;
	if (control == 0) {
		result=ADD();
	}
	else if (control == 1) {
		result = SUB();
	}
	else if (control == 2) {
		result = MULT();
	}

	cout << "-->" << number1DecimalSize << "  " << number1FloatSize << "  " << number1Decimal << "." << number1Float << endl;
	cout << "-->" << k << endl;
	cout << "-->" << number2DecimalSize << "  " << number2FloatSize << "  "<< number2Decimal<<"."<< number2Float << endl;


	cout << result;
}
double  ADD() {
	double result=.0;
	return result;
}
double SUB() {
	double result = .0;
	return result;
}
double MULT() {
	double result = .0;
	return result;
}
int CheckOperator(char t) {
	if (t == '+')
		return 0;
	else if (t == '-')
		return 1;
	else if (t == '*')
		return 2;
	return -1;
}
int IsDigit(char t) {
	t -= '0';
	if (t > 0) {
		t *= -1;
		t += 9;
		if (t > 0)
			return 1;
	}

	return 0;
}

int main() {
	DoCalculation("12.456 + 412.1234");

	int a = 0;
	cin >> a;
	return 0;
}