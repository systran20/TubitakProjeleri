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

Processing tarafında COM port numaraları COM2..COM15 e kadar otomatik olarak bulunur.<br>
<pre>
  
//13.11.2020
//Ömer ERMİŞ
//Read data from COM2...COM15 ports (multiple ARDUINOS)

import processing.serial.Serial;
String msg;
ArrayList<Serial> COMPorts= new ArrayList<Serial>();


void setup() {  
  noLoop(); 
  findPort();
}

void draw() {
  if (msg!=null) println(msg);
}

void serialEvent(Serial s) {
  for (int i=0; i<COMPorts.size(); i++) {    
    if (COMPorts.get(i)==s) {
      //println("tekikleyen port->",s);
      //msg = s.readString();
      msg = s.readStringUntil('\n');
      redraw = true;
    }
  }
}

void findPort() {
  String[] ports = Serial.list();
  printArray(ports);
  for (String p : ports)  for (int i = 2; i <= 15; ++i)
    if (p.equals("COM" + i)) {
      Serial tmpPort;
      tmpPort =new Serial(this, p, 9600);
      tmpPort.bufferUntil('\n');
      COMPorts.add(tmpPort);      
      //return p;
    }
}
</pre>
