function FivDigsStr = f(x)
%formatting to character array with 5 significant digits and then splitting at each tab
FivDigsStr = categorical(split(sprintf('%0.5G\t',x)));
%Removing the last (empty) value (which is included due to \t)
FivDigsStr = FivDigsStr(1:end-1);
end