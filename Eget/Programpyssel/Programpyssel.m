CourseArray = [BS HN R TF MAI];
SpecNames = ["BS" "HN" "R" "TF" "MAI"];
Common = ["Gemensamm kurs", "Program gemensamt med"];

for l = 1:length(SpecNames)
    Spec = SpecNames(l);
    Common = [Common; '-------' + Spec + '-------', '---------------------'];
    s = size(Common);
    idx = s(1) + 1;
    for k = 1:15
        Compare = CourseArray(k,l);
        for i = 1:length(SpecNames)
            if i ~= l
                for j= 1:15
                    tCourse = CourseArray(j,i);
                    if Compare == tCourse && Compare ~= "_"                        
                        is = ismember(Common(idx:end,1),Compare);
                        index = find(is);
                        if index ~=0
                            comms = Common(index + idx - 1, 2);
                            Common(index + idx - 1, 2) = comms + ', ' + SpecNames(i);
                        else 
                            Common = [Common; Compare, SpecNames(i)];
                        end                       
                    end
                end
            end
        end
    end
end
