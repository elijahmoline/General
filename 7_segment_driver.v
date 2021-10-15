module seg_driver(
  input [0:3]SW,
  output
);
  assign s1=SW[0];
  assign s2=SW[1];
  assign s3=SW[2];
  assign s4=SW[3];
  
  assign A = s3 | s1 | s2 & s4 | ~s2 & ~s3 & ~s4;
  assign B = ~s2 | ~s3 & ~s4 | s3 & s4;
  assign C = s2 | ~s3 | s4;
  assign D = s3 & ~s4 | s1 & ~s4 | ~s2 & ~s4 | ~s1 & s3 & ~s4;
  assign E = ~s2 & ~s4 | s1 & ~s3 & ~s4 | ~s1 & s3 & ~s4;
  assign F = s1 | ~s3 & ~s4 | s2 & ~s3 | s2 & ~s4; 
  assign G = s1 | s3 & ~s4 | ~s2 & s3 | s2 & ~s3;
  
  
