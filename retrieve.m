str=input('enter the string:','s');
ascii=double(str);
ascii
leng=length(ascii);
Bin=zeros(leng,8);
   for i=1:1:leng
     for k=8:-1:1
        Bin(i,k)=mod(ascii(i),2);
        ascii(i)=(ascii(i)-Bin(i,k))/2;
     end
   end
   Bin %letter to binary
   subplot(3,1,1);
pic=imread('D:/space.png');
imshow(pic);
[row col pan]=size(pic);
r=pic(:,:,3);
a=zeros(leng,8);
for i=1:1:leng
    for j=1:1:8
      a(i,j)= r(i,j);
    end
end
a %pixel values
B1=zeros(leng*8,8);
for i=1:1:leng
for j=1:1:8
 for k=8:-1:1
     if i>1
          B1(j+8*(i-1),k)=mod(a(i,j),2);
        a(i,j)=(a(i,j)-B1(j+8*(i-1),k))/2; 
     else
         B1(j,k)=mod(a(i,j),2);
        a(i,j)=(a(i,j)-B1(j,k))/2;
        
     end
 end
end
end
B1%their binary

  for i=1:1:leng 
  for j=1:1:8
       if i>1
     B1((j+8*(i-1)),8)=Bin(i,j);
       else
     B1(j,8)=Bin(i,j);
       end
  end
  end
  D=zeros(leng*8,8);
  D=B1;
  D %lsb changing
  d=zeros(1,leng*8);
  temp=zeros(1,leng*8);
  add=0;
   for i=1:1:leng*8
  for j=8:-1:1
  add=add+(D(i,j)*2^(8-j));
  end
 temp(1,i)=add;
 add=0;
   end
    temp %convert back to decimal
    dummy=zeros(leng,8);
    for i=1:1:leng
        for j=1:1:8
            if i==1
            dummy(i,j)=temp(1,j);
            elseif i>1
             dummy(i,j)=temp(1,j+8*(i-1));
            end
        end
    end
    dummy; %fitting into array of leng*8 size
    for j=1:1:leng
    for i=1:1:8
         pic(j,i,3)=dummy(j,i);
    end
    end
    subplot(3,1,2);
    imshow(pic); %modified pic
    
    [row1 col1 pan1]=size(pic);
r1=pic(:,:,3);
a1=zeros(leng,8);
for i=1:1:leng
    for j=1:1:8
      a1(i,j)= r1(i,j);
    end
end
a1 %pixel values
B1=zeros(leng*8,8);
for i=1:1:leng
for j=1:1:8
 for k=8:-1:1
     if i==1
         B1(j,k)=mod(a1(i,j),2);
        a1(i,j)=(a1(i,j)-B1(j,k))/2;
     elseif i>1
          B1(8*(i-1)+j,k)=mod(a1(i,j),2);
        a1(i,j)=(a1(i,j)-B1(8*(i-1)+j,k))/2; 
     end
 end
end
end
B1 %binary values of pixels
d1=zeros(1,leng*8);
for i=1:1:leng*8
   
    d1(1,i)=B1(i,8);
    
end
d1 %ordering
 dummy1=zeros(leng,8);
    for i=1:1:leng
        for j=1:1:8
            if i==1
            dummy1(i,j)=d1(1,j);
            elseif i>1
             dummy1(i,j)=d1(1,j+8*(i-1));
            end
        end
    end
    dummy1 %fitting
    var=zeros(leng,1);
    sum=0;
    for i=1:1:leng
        for k=8:-1:1
            sum=sum+(dummy1(i,k)*2^(8-k));
        end
        var(i,1)=sum;
        sum=0;
    end
    var %convert back to decimal
    z=zeros(leng,1);
    for i=1:1:leng
      if var(i,1)==92
           break
      elseif var(i,1)>0
         z(i,1)=char(var(i,1));
      end
    end
    z=char(var) %char
    
    
    
    
    
    
    
 
 
