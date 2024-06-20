clear;clc;
A = importdata('出租车数据1.txt');
B = A.data;
[m,n] = size(B);
for i = 1:m
    dateTimeStr = num2str(B(i,2));
    
    yearStr = dateTimeStr(1:4);
    monthStr = dateTimeStr(5:6);
    dayStr = dateTimeStr(7:8);
    hourStr = dateTimeStr(9:10);
    minuteStr = dateTimeStr(11:12);
    secondStr = dateTimeStr(13:14);
    
    year = str2double(yearStr);
    month = str2double(monthStr);
    day = str2double(dayStr);
    hour = str2double(hourStr);
    minute = str2double(minuteStr);
    second = str2double(secondStr);
    
    Time(i,1) = year;
    Time(i,2) = month;
    Time(i,3) = day;
    Time(i,4) = hour;
    Time(i,5) = minute;
    Time(i,6) = second;
end

for j = 1 :39
    MJD1(j,1) = culTime(Time(j,1),Time(j,2),Time(j,3),Time(j,4),Time(j,5),Time(j,6));
end

for k = 1:38
    velocity(k,1) = calVel(B(k,3),B(k+1,3),B(k,4),B(k+1,4),MJD1(k,1),MJD1(k+1,1));
end

for i = 1:38
    angle(i,1) = culAng(B(i,3),B(i,4),B(i+1,3),B(i+1,4));
end

for i = 1:38
    ans1(i,1) = i;
    ans1(i,2) = MJD1(i,1);
    ans1(i,3) = MJD1(i+1,1);
    ans1(i,4) = velocity(i,1);
    ans1(i,5) = angle(i,1);
end

[m,n] = size(ans1);
cur = fopen('output.txt','wt');
fprintf(cur,'%s','以下是输出结果:(序号、起始时间、结束时间、速度、方位角）');
fprintf(cur,'\n');
for i = 1:m
    for j = 1:n
        fprintf(cur,'%f',ans1(i,j));
        fprintf(cur,'      ');
    end
    fprintf(cur,'\n');
end
fclose(cur);