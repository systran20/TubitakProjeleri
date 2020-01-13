#define BUTON_ADET 6
int butonPin[]={8,9,10,11,12,13};

//SENT tuşlara bastıktan sonra en son 63 göndermek için kullanılır.
//(INPUT_PULLUP 111111==63)
boolean SENT=false; 

void setup()
{
  Serial.begin(9600);
  for (int i=0;i<BUTON_ADET;i++) {
    pinMode(butonPin[i], INPUT_PULLUP);
  }   
}
void loop() {

  //hiçbir düğme basılıdı değilse (INPUT_PULLUP dikkat 111111=63) 
  //ve 63 verisi gönderilmediyse
  // düğmelere basmayı bıraktıktan sonra
  //1 kere 63 gönder
  if ((PINB==63) && (!SENT)) {
    Serial.println(63);
    SENT=true;    
  }

  //eğer düğmelere basılıysa gönder (INPUT_PULLUP 111010<63)  
  //düğmelere basılmıyorsa boşuna veri gönderme
  if(PINB<63) {
    Serial.println(PINB);
    SENT=false;
    delay(10);
  }   
}
