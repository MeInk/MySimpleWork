unit lubenets;

interface

uses common;

procedure InsertSort4_1(var A:TArray;var Vect:TVector);
procedure InsertSort4_2(var A:TArray);
procedure InsertSort4_3(var A:TArray);
procedure InsertSort4_4(var A:TArray);

implementation


procedure InsertSort4(var Vect:TVector; n:word);
var
  X:integer;
  i,j,k,L,R:word;
begin
  for i:=2 to n do
  begin
    X:=Vect[i];
    L:=1; R:=i;
    while L<R do
    begin
      j:=(L+R) div 2;
      if Vect[j]<=X then
        L:=j+1
      else
        R:=j;
    end;
    for k:=i-1 downto R do
      Vect[k+1]:=Vect[k];
    Vect[R]:=X;
  end;
end;


procedure InsertSort4_1(var A:TArray; var Vect:TVector);
var
  i:word;
begin
  for i:=1 to p do
  begin
    FillVectByMatrix(A[i],Vect);
    InsertSort4(Vect,m*n);
    FillMatrixByVect(A[i],Vect);
  end;
end;


procedure InsertSortForMatrix(var A:TMatrix; n1:word);
var
  X:integer;
  i,j,k,L,R:longint;
begin
  for i:=1 to n1 do
  begin
    X:=A[i div n+1,i mod n+1];
    L:=0; R:=i;
    while L<R do
    begin
      j:=(L+R)div 2;
      if A[j div n+1,j mod n+1]<=X then
        L:=j+1
      else
        R:=j;
    end;
    for k:=i-1 downto R do
      A[(k+1)div n+1,(k+1)mod n+1]:=A[k div n+1,k mod n+1];
    A[R div n+1,R mod n+1]:=X;
  end;
end;

procedure InsertSort4_2(var A:TArray);
var
  i:word;
begin
  for i:=1 to p do
    InsertSortForMatrix(A[i],m*n-1);
end;

procedure SortWithInsertLogic(var A:TMatrix);
var
  X:integer;
  ix,iy,jx,jy,kx,ky,Lx,Ly,Rx,Ry:word;
begin
  for iy:=1 to m do
    for ix:=1 to n do
      if not((iy=1)and(ix=1)) then
        begin
          X:=A[iy,ix];
          Lx:=1;Ly:=1;
          Rx:=ix;Ry:=iy;
          while (Ly<Ry)or(Lx<Rx) do
          begin
            jy:=Ly+(Lx-1+((Ry-Ly)*(n-1)+Rx-Lx)div 2)div n;
            jx:=(Lx-1+((Ry-Ly)*(n-1)+Rx-Lx)div 2)mod n+1;
            if A[jy,jx]<=X then
              begin
                Lx:=jx mod n+1;
                Ly:=jy+jx div n;
              end
            else
              begin
                Rx:=jx;
                Ry:=jy;
              end;
          end;
          if iy=ry then
            for kx:=ix-1 downto Rx do
              A[iy,kx+1]:=A[iy,kx]
          else
          begin
            for kx:=ix-1 downto 1 do
              A[iy,kx+1]:=A[iy,kx];
            for ky:=iy-1 downto Ry+1 do
            begin
              A[ky+1,1]:=A[ky,n];
              for kx:=n-1 downto 1 do
                A[ky,kx+1]:=A[ky,kx];
            end;
            A[Ry+1,1]:=A[Ry,n];
            for kx:=n-1 downto Rx do
              A[Ry,kx+1]:=A[Ry,kx];
          end;
          A[Ry,Rx]:=X;
        end;
end;


procedure InsertSort4_3(var A:TArray);
var
  i:word;
begin
  for i:=1 to p do
    SortWithInsertLogic(A[i]);
end;

procedure InsertSort4_4(var A:TArray);
var
  M:TMatrix;
  X:integer;
  i,j,k,L,R:word;
begin
  for i:=2 to p do
  begin
    X:=A[i,1,1];
    M:=A[i];
    L:=1;R:=i;
    while L<R do
    begin
      j:=(L+R) div 2;
      if A[j,1,1]<=X then
        L:=j+1
      else
        R:=j;
    end;
    for k:=i-1 downto R do
      A[k+1]:=A[k];
    A[R]:=M;
  end;
end;
end.

