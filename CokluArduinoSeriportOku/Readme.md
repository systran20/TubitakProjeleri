<h1><b>Arduino ve Processing dilleri kullanılmıştır.</b></h1>
<p>
Bir bilgisayara birden fazla arduino bağlanır. (USB Portlara)<br>
Herbir Arduino içine aşağıdaki basit kod, yaptığı işle alakalı olarak "Mesajını buraya yaz" kısmı değiştirilerek yüklenir.</br>
<pre>
void setup() {    
  Serial.begin(9600);
}

void loop() {   
  Serial.println("Mesajı Buraya Yaz"); //Her arduinonun farklı mesaj göndermesi gerekir.
  delay(1250);
}
</pre>

Processing tarafında COM port numaraları COM2..COM15 e kadar otomatik olarak bulunur.
