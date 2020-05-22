import oscP5.*;
import netP5.*;

//Objeto que se recibe
OscP5 oscP5;

//Dirección donde envio mis mensajes
NetAddress direccionRemota;

float x1,x2,m;
int lighton,greenlight,yellowlight,redlight;


void setup() {
size(512, 512);
oscP5 = new OscP5(this, 12000);
}

void draw() 
{
  background(0);
  if(lighton==1)
    {
      if (greenlight == 1)
      {
        pushMatrix();
        noStroke();
        fill(0,255,0,m);
        ellipse(256,100,100,100);
        popMatrix(); 
      }
      if (yellowlight == 1)
      {
        pushMatrix();
        noStroke();
        fill(255,255,0,m);
        ellipse(256,250,100,100);
        popMatrix(); 
      }
      if (redlight == 1)
      {
        pushMatrix();
        noStroke();
        fill(255,0,0,m);
        ellipse(256,400,100,100);
        popMatrix(); 
      }
    }
}


//cada vez que se recibe un mensaje de osc en el puerto asignado, se llama esta función
void oscEvent(OscMessage theOscMessage) {  
  //si el mensaje está etiquetado como "/x"
  if (theOscMessage.checkAddrPattern("/x1") == true) 
  {
    //asigna el valor entero a la variable x
    x1 = theOscMessage.get(0).floatValue();
    m = map(x1, 0, 1, 0, 255);
    print(m);
    if (x1 > 0.01)
      {
        lighton = 1;
        print(lighton);
      }
    else
      {
    lighton = 0;
      }
  }

//si el mensaje está etiquetado como "/x2"
if (theOscMessage.checkAddrPattern("/x2") == true) 
  {
//Asigna el valor entero a la variable x2
    x2 = theOscMessage.get(0).intValue();
    if ( x2 >= 50 && x2 < 580)
    {
      greenlight = 1;
    }
    else
    {
      greenlight = 0;
    }
    if ( x2 >= 600 && x2 < 990)
    {
      yellowlight = 1;
    }
    else
    {
      yellowlight = 0;
    }
    if ( x2 >= 1100)
    {
      redlight = 1;
    }
    else
    {
      redlight = 0;
    }
  }
}
