#include <iostream>
#include <cstring>
#include <cmath>

using namespace std;

int number1Decimal = 0;
int number1Float = 0;
int number2Decimal = 0;
int number2Float = 0;

int number1IsPozitif = 0;
int number2IsPozitif = 0;
int resultIsPozitif = 0;


int number1DecimalSize = 0;
int number1FloatSize = 0;
int number2DecimalSize = 0;
int number2FloatSize = 0;

int resultDecimal = 0;
int resultFloat = 0;
int resultDecimalSize = 0;
int resultFloatSize = 0;
int IsDigit(char t);
int CheckOperator(char t);
void ADD();
void SUB();
void MULT();
void DoCalculation(char * a)
{
	 number1Decimal = 0;
	 number1Float = 0;
	 number2Decimal = 0;
	 number2Float = 0;

	 number1IsPozitif = 0;
	 number2IsPozitif = 0;
	 resultIsPozitif = 0;


	 number1DecimalSize = 0;
	 number1FloatSize = 0;
	 number2DecimalSize = 0;
	 number2FloatSize = 0;

	 resultDecimal = 0;
	 resultFloat = 0;
	 resultDecimalSize = 0;
	 resultFloatSize = 0;

	int size = strlen(a);
	int control = 0;
	int i = 0;

	control = IsDigit(a[i]);

	if (control == 0) { // sayý deðil
		number1IsPozitif = 1; //number1 < 0;
		++i;
	}

	for (; i < size; ++i) {
		control = IsDigit(a[i]);
		if (control == 1) // sayý ise 
		{
			number1Decimal *= 10;
			number1Decimal += a[i] - 48 ;
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
	
	++i; //operatore geldi

	char k = a[i]; // hangi opertor olduðunu sakla 
	++i;//boþluk
	++i;


	control = IsDigit(a[i]);
	cout << "**** K *--->" << k << endl;
	cout << "**** a[i] *--->" << a[i] << endl;
	cout << "**** control *--->" << control << endl;

	if (control == 0) { // is digit deðil 
		number2IsPozitif = 1; //number2 < 0;
		++i;
	}
	
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

	if (number1FloatSize > number2FloatSize)
	{
		number2Float *= pow(10, number1FloatSize - number2FloatSize);
		number2FloatSize = number1FloatSize;
	}
	else if (number2FloatSize > number1FloatSize)
	{
		number1Float *= pow(10, number2FloatSize - number1FloatSize);
		number1FloatSize = number2FloatSize;
	}

	control = CheckOperator(k);
	
	if (control == 0) {
		ADD();
	}
	else if (control == 1) {
		SUB();
	}/*
	else if (control == 2) {
		MULT();
	}
	*/
	cout << endl << "-->" << k << endl;

	if (number1IsPozitif == 0)
		cout << endl  << "-->" << number1DecimalSize << "  " << number1FloatSize << "  " << number1Decimal << "." << number1Float << endl;
	else
		cout << endl << "-->" << number1DecimalSize << "  " << number1FloatSize << "  -" << number1Decimal << "." << number1Float << endl;


	if (number2IsPozitif == 0)
		cout << endl << "-->" << number2DecimalSize << "  " << number2FloatSize << "  " << number2Decimal << "." << number2Float << endl;
	else
		cout << endl << "-->" << number2DecimalSize << "  " << number2FloatSize << "  -" << number2Decimal << "." << number2Float << endl;
}
void  ADD() {
	if (number1IsPozitif == 0 && number2IsPozitif == 0) {
		// + + +
		// float kýsmýný topla
		resultFloat = number1Float + number2Float;
		int check = resultFloat;
		for (size_t i = 0; i < number1Float; i++)
		{
			check /= 10;
		}
		resultFloatSize = number1FloatSize;

		if (check > 1) {
			resultDecimal++;
		}
		resultDecimal = number1Decimal + number2Decimal;

		int temp = resultDecimal;
		for (; temp > 0;) {
			++resultDecimalSize;
			temp /= 10;
		}

		resultIsPozitif = 0;
		/* eðer result float ýn size ý number 1 dem büyükse resultDecimal i  1 arttýr */
		//decimal kýsmý toplama
	}
	else if (number1IsPozitif == 0 && number2IsPozitif == 1) {
		// + + -

		resultFloat = number1Float - number2Float;
		resultDecimal = number1Decimal - number2Decimal;
		/*cout << "DECIMAL" << resultDecimal << endl;
		cout << "DECIMAL" << number1Decimal << endl;
		cout << "DECIMAL" << number2Decimal << endl;*/

		if (resultFloat < 0) {
			if (resultDecimal > 0) {
				resultFloat *= -1;
				resultDecimal--;
				resultFloat += pow(10, number1FloatSize);
			}
		}
		resultFloatSize = number1FloatSize;
		int temp = resultDecimal;

		for (; temp > 0;) {
			temp /= 10;
			++resultDecimalSize;
		}
		// size fonksiyonun çaðýr resultDecimal size a ata
		if (resultDecimal < 0)
			resultIsPozitif = 1; //result < 0
		else
			resultIsPozitif = 0; //result > 0

	}
	else if (number1IsPozitif == 1 && number2IsPozitif == 0) {
		// - + +
		resultFloat = number2Float - number1Float;
		if (resultFloat < 0) {
			resultFloat *= -1;
			if (resultDecimal > 0) {
				resultDecimal--;
				resultFloat += pow(10, number2FloatSize);
			}

			resultFloatSize = number2FloatSize;
			resultDecimal = number2Decimal - number1Decimal;
			// size fonksiyonun çaðýr resultDecimal size a ata
			if (resultDecimal < 0)
				resultIsPozitif = 1; //result < 0
			else
				resultIsPozitif = 0; //result > 0

		}

		//decimal
	}
	else if (number1IsPozitif == 1  && number2IsPozitif == 1) {
		// - + -,
		resultFloat = number1Float + number2Float;
		int check = resultFloat;
		for (size_t i = 0; i < number1Float; i++)
		{
			check /= 10;
		}
		resultFloatSize = number1FloatSize;

		if (check > 1) {
			resultDecimal++;
		}
		resultDecimal = number1Decimal + number2Decimal;

		int temp = resultDecimal;
		for (; temp > 0;) {
			++resultDecimalSize;
			temp /= 10;
		}

		resultIsPozitif = 1;
	}

}
void SUB() {

	if (number1IsPozitif == 0 && number2IsPozitif == 0) {
		// + - + 
		number2IsPozitif = 1; // number 2 negatif gibi davransýn 
		ADD();
		number2IsPozitif = 0; // number 2 negatif gibi davransýn 

	}
	else if (number1IsPozitif == 0 && number2IsPozitif ==1 ) {
		// + - -
		number2IsPozitif = 0; // number 2 pozitif gibi davransýn
		ADD();
		number2IsPozitif = 1; // number 2 negatif gibi davransýn 

	}
	else if (number1IsPozitif == 1 && number2IsPozitif == 0) {
		// - - +
		number2IsPozitif = 1; // number 2 negatif gibi davransýn 
		ADD();
		number2IsPozitif = 0; // number 2 negatif gibi davransýn 

	}
	else if (number1IsPozitif == 1 && number2IsPozitif == 1) {
		// - - -
		number2IsPozitif = 0; // number 2 negatif gibi davransýn
		ADD();
		number2IsPozitif = 1; // number 2 negatif gibi davransýn

	}
}
void MULT() {

	if (number1IsPozitif >= 0 && number2IsPozitif >= 0) {
		// + * + 
		// döngü içinde tolasýn sonuç  + 
		resultIsPozitif = 0; // result > 0 
	}
	else if (number1IsPozitif >= 0 && number2IsPozitif < 0) {
		// + * -
		resultIsPozitif = 1; // result < 0 
	}
	else if (number1IsPozitif < 0 && number2IsPozitif >= 0) {
		// - * +
		resultIsPozitif = 1; // result < 0 
	}
	else if (number1IsPozitif < 0 && number2IsPozitif < 0) {
		// - * -
		resultIsPozitif = 0; // result > 0 
	}

	int f = 0;
	int mul = 1;
	for (int i = 0; i < number2FloatSize; ++i) {
		f = number2Float % 10;
		f *= mul;
		for (int h = 0; h < f; h++)
		{
			resultFloat += number1Float;
		}
		mul *= 10;
	}
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
	t -= 48;
	if (t >= 0) {
		t *= -1;
		t += 9;
		if (t >= 0)
			return 1;
	}
	return 0;
}

int main() {
	DoCalculation("12.456 - 412.12");

	if(resultIsPozitif == 0)
		cout << endl << resultDecimal << " . " << resultFloat << endl;
	else
		cout << endl <<"-" <<resultDecimal << " . " << resultFloat<<endl;

	DoCalculation("-6782.456 - 412 .12");

	if (resultIsPozitif == 0)
		cout << endl << resultDecimal << " . " << resultFloat;
	else
		cout << endl << "-" << resultDecimal << " . " << resultFloat << endl;

	DoCalculation("-178.456 - -412.1234");

	if (resultIsPozitif == 0)
		cout << endl << resultDecimal << " . " << resultFloat << endl;
	else
		cout << endl << "-" << resultDecimal << " . " << resultFloat << endl;
	
	DoCalculation("11232.456 - -412.14");

	if (resultIsPozitif == 0)
		cout << endl << resultDecimal << " . " << resultFloat << endl;
	else
		cout << endl  << "-" << resultDecimal << " . " << resultFloat << endl;	int a = 0;
	cin >> a;
	return 0;
}