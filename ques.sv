class cons;
    rand int a[$];
    rand int a1[$];
    rand int a2[$];
    rand int a3[$];
    constraint c1{
      a.size() == 15;
      a1.size() inside {[3:15]};
      a2.size() inside {[3:15]};
      a3.size() inside {[3:15]};
      a1.size()+a2.size()+a3.size() == a.size();       
      foreach(a[i]){
        a[i] inside{[25:50]};
        foreach(a[j]){
          if(i!=j)
            a[i]!=a[j];
        }         
      }
      foreach(a1[i]){
          a1[i] == a[i];
      }
      foreach(a2[j]){
        a2[j] == a[j+a1.size()];   
          
      }
      foreach(a3[k]){
       a3[k] == a[k+a1.size()+a2.size()];   
          
      }    
    }
        
        
   function void post_randomize();
        $display("op a %0p  ---- \n a1 %0p---- \n a2 %0p ----\n a3 %0p
                 ",a,a1,a2,a3);
  endfunction
        
endclass
        
cons c;
  
module tb;
  
  initial begin    
    c = new();
    repeat(2) begin
      assert(c.randomize());
end
  end
endmodule
