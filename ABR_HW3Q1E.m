%% HW3 Q1E
%% E1
n = 10; % experts n = 10, t = 100
eta = 0.5; % learning rate
repeat = 100; % repeat times
gather_regret = zeros(repeat, 100);
gather_modelLoss = zeros(repeat, 100);
gather_weight = zeros(repeat, n);
for i = 1:repeat
    [data,labels] = getDataForTarget2(n);
    [regrets, modelLosses, weights] = hedge(data,labels,eta);
    gather_regret(i,:) = regrets;
    gather_modelLoss(i,:) = modelLosses;
    gather_weight(i,:) = weights;
end
average_regret = zeros(1, repeat);
average_loss = zeros(1, repeat);
for j = 1:repeat
    average_regret(j) = sum(gather_regret(:,j))/100;
    average_loss(j) = sum(gather_modelLoss(:,j))/100;
end
figure
plot(average_regret, '-r');
hold on
plot(average_loss, '-.b');
xlabel('repeat');
ylabel('aveerage');
% legend({'average regret', 'average loss'});
hold on
%% E2
n = 100; % experts n = 10, t = 100
gather_regret2 = zeros(repeat, 100);
gather_modelLoss2 = zeros(repeat, 100);
gather_weight2 = zeros(repeat, n);
for i = 1:repeat
    [data2,labels2] = getDataForTarget2(n);
    [regrets2, modelLosses2, weights2] = hedge(data2,labels2,eta);
    gather_regret2(i,:) = regrets2;
    gather_modelLoss2(i,:) = modelLosses2;
    gather_weight2(i,:) = weights2;
end
average_regret2 = zeros(1, repeat);
average_loss2 = zeros(1, repeat);
for j = 1:repeat
    average_regret2(j) = sum(gather_regret2(:,j))/100;
    average_loss2(j) = sum(gather_modelLoss2(:,j))/100;
end
plot(average_regret2, '-g');
hold on
plot(average_loss2, '-.y');
xlabel('repeat2');
ylabel('aveerag2');
legend({'average regret n = 10', 'average loss n = 10','average regret n =100', 'average loss n =100'});
%%