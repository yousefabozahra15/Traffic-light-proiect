int count = 9;
int count2 = 3;
int count3 = 3;
int i = 3;
int arr[] = {0, 16, 32, 48};
void Automatic();
void Manual();
void main() {
         ADCON1 = 0x07;
         trisb = 0b00000000;
         trisc = 0b00000000;
         trisd = 0b00000000;
         trisa = 0b11111111;
         for(;;){
                if (porta.b1 == 1)
                {
                   Automatic();
                }
                else
                {
                   Manual();
                }
         }

}
void Automatic()
{
            portd = 0b11111111;
            for (i = 3; i >= 0; i--)
            {
                for (count = 9; count >= 0; count--)
                {
                    if (porta.b1 == 0)
                        {
                               portb = 0;
                               count2 = 3;
                               count3 = 3;
                               break;
                        }
                        if ( (arr[i] + count) == 57 || (arr[i] + count) == 56)
                        {
                            continue;
                        }
                        if ((arr[i] + count) > 53)
                        {
                            portc = 0b00010001;
                        }
                        else if ((arr[i] + count) == 52)
                        {
                            portc = 0b00100001;
                        }
                        else if ((arr[i] + count) == 35)
                        {
                            portc = 0b00001010;
                        }
                        else if ((arr[i] + count) == 32)
                        {
                            portc = 0b00001100;
                        }
                        portb = arr[i] + count;
                        delay_ms(1000);
                 }
            }
}
void Manual()
{
      if (porta.b0 == 0)
           {
               portd = 0b00000011;
               for (count2; count2 >= 0; count2--)
               {
                   portc = 0b00001010;
                   portb = count2;
                   delay_ms(1000);
               }
               portc = 0b00001100;
               count3 = 3;
           }
           else if (porta.b0 == 1)
           {
                portd = 0b00001100;
                for (count3; count3 >= 0; count3--)
                {
                    portc = 0b00010001;
                    portb = count3;
                    delay_ms(1000);
                }
                portc = 0b00100001;
                count2 = 3;
           }
}