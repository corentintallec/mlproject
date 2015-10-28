clear all;
load('Rome_classification');

% Parameters
alpha = 1.0;

X = normalize(X_train);
y_train(y_train == -1) = 0; 

%% split data in K fold (we will only create indices)
setSeed(1);
K = 4;
N = size(y_train,1);
idx = randperm(N);
Nk = floor(N/K);
for k = 1:K
    idxCV(k,:) = idx(1+(k-1)*Nk:k*Nk);
end

%% Features engineering
X = normalize(X_train);
classifiedFeatures = [3 16 25 28 34];

X = poly(X,3);
X = normalize(X);

%% K-fold cross validation
tic
lambdas = logspace(-4,2,100);
for i = 1:length(lambdas)
    % K-fold cross validation
    for k = 1:K
        idxTe = idxCV(k,:);
        idxTr = idxCV([1:k-1 k+1:end],:);
        idxTr = idxTr(:);
        yTe = y_train(idxTe);
        yTr = y_train(idxTr);
        XTe = X(idxTe,:);
        XTr = X(idxTr,:);
        tXTe = [ones(size(XTe,1),1) XTe];
        tXTr = [ones(size(XTr,1),1) XTr];
    
        % Model train
        beta = penLogisticRegression(yTr, tXTr, alpha,lambdas(i));

        % Prediction
        trPr = sigmoid(tXTr*beta);
        tePr = sigmoid(tXTe*beta);
        %trBin(trPr > 0.5) = 1;
        %teBin(tePr > 0.5) = 1;

        % Error calculation
        rmseTrK(k) = rmse(yTr, trPr);
        rmseTeK(k) = rmse(yTe, tePr);
    end

    % Mean error calculation
    rmseTr(i) = mean(rmseTrK);
    rmseTe(i) = mean(rmseTeK);
end
toc
%% Error calculation
figure(1);
subplot(2,1,1);
semilogx(lambdas, rmseTr,'color','b', 'LineWidth',2);
ylabel('Train RMSE','fontsize',12,'fontname','Helvetica')
xlabel('lambda','fontsize',12,'fontname','Helvetica')
grid on;
subplot(2,1,2);
semilogx(lambdas, rmseTe,'color','r', 'LineWidth',2);
ylabel('Test RMSE','fontsize',12,'fontname','Helvetica')
xlabel('lambda','fontsize',12,'fontname','Helvetica')
grid on;
%binLoss = binLoss(y_train, y_predicted_bin);
%logLoss = logLoss(y_train, y_predicted);



