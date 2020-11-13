//herbir arduino içinde aşağıdaki basit kod bulunur.
//farklı farklı işleri yapan ardunolar için değişik veriler seri porta yazdırılır.

void setup() {    
  Serial.begin(9600);
}

void loop() {   
  Serial.println("Mesajı Buraya Yaz"); //Her arduinonun farklı mesaj göndermesi gerekir.
  delay(1250);
}
