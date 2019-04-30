clear;
load('testdata.mat');
data= csvread('test.csv');
label_num =grp2idx(label);

X=data(1:30,:);
Y=label_num(1:30);

rand_num=randperm(30);

X_train = X(rand_num(1:20),:);
Y_train = Y(rand_num(1:20),:);

X_test = X(rand_num(21:end),:);
Y_test = Y(rand_num(21:end),:);

c = cvpartition(Y_train,'k',5);
opts = statset('display','iter');
fun = @(train_data, train_labels, test_data, test_labels)...
    sum(predict(fitcsvm(train_data, train_labels, 'KernelFunction', 'rbf'),test_data) == test_labels);
[fs,history] = sequentialfs(fun,X_train,Y_train,'cv',c,'options',opts,'nfeatures',2);

X_train_w_best_features = X_train(:,fs);
Md1 = fitcsvm(X_train_w_best_features,Y_train,'KernelFunction','rbf',...
    'OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
    'expected-improvement-plus','ShowPlots',true));

X_test_w_best_features = X_test(:,fs);
accuracy = sum(predict(Md1, X_test_w_best_features) == Y_test)/length(Y_test)*100;
disp('Accuracy :');
disp(accuracy);