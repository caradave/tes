clc;
close all;
clear all;

figure, stem(offset(0, 1), offset(0, 1)), grid on
figure, stem(offset(-5, 1), offset(0, 1)), grid on
figure, stem(-offset(-5, 1), offset(0, 1)), grid on
figure, stem(0.5*offset(0, 2), offset(0, 2)), grid on

figure, stem(function_sum(offset(-10, 1), offset(0, 1)), add_delta(function_sum(offset(-10, 1), offset(0, 1)), function_sum(offset(0, 1),flip(offset(0, 1))), 0, -10)), grid on

function vett = offset(off_set, pace)
    vett = off_set:pace:10+off_set;
end

function vett = function_sum(vett1, vett2)
   vett = [];

   for i = 1:length(vett1)-1
       vett = horzcat(vett, vett1(i));
   end
    
   vett = horzcat(vett, vett1(length(vett1))+vett2(1));

   for i = 2:length(vett2)
       vett = horzcat(vett, vett2(i));
   end

end

function vett = add_delta(pos_vett, data_vett, pos, high)
    vett = [];
    for i = 1:length(data_vett)
        if (pos_vett(i) == pos)
            vett = horzcat(vett, data_vett(i) + high);
        else
            vett = horzcat(vett, data_vett(i));
        end
    end
end
