pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template CustomCircuit () {  

  // Declaration of signals. or Signal Input  
   signal input a;  
   signal input b;  


  //Signal from our gates
  signal x;
  signal y;


  //final output of signal
   signal output Q;


  //components gates used to create circuits
  component andGate = AND();
  component notGate = NOT();
  component orGate = OR();


  //circuit logic
  //for AND gate
  andGate.a <== a;
  andGate.b <== b;
  x <== andGate.out;

  //for NOT gate
  notGate.in <== b;
  y <== notGate.out;


  //for OR gate
  orGate.a <== x;
  orGate.b <== y;
  Q <== orGate.out;
  
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = CustomCircuit();