%求两个向量alpha、beta的夹角: qiujj = 求夹角.
function theta=abc(alpha,beta)
    if length(alpha)~=length(beta)
        disp('输入的向量维数不匹配，请重新输入')
    end
    a=sqrt(sum(alpha.^2));
    b=sqrt(sum(beta.^2));
    c=abs(sum(alpha.*beta));
    x=c/(a*b);
    theta=acos(x);
