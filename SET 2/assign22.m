% x = [-1 -2 -2 -1 1 2 1 2];
% y = [-1 -2 -1 -2 2 1 1 2];
% scatter(x,y,'b');
% hold on;

% one = ones(length(x),1);
% A = cat(2,x',one);
% theta = pinv(A)*(y');
% m = theta(1);
% c = theta(2);
% y_pred = m*x + c;
% plot(x,y_pred,'r');

% MSE = immse(y,y_pred);
% %disp(MSE)

% LogReg()

% function LogReg()
%     clear all; 
%     close all;
%     DataPoints = [-1 -1; -2 -2; -2 -1; -1 -2; 1 2; 2 1; 1 1; 2 2];
%     DataPoints = DataPoints';
%     DataPoints = [ones(1, size(DataPoints, 2)); DataPoints; -1 -1 -1 -1 1 1 1 1];
%     RegMdl = [0;1;-1]; 
%     W = findRegModel(DataPoints, RegMdl);
% end

% function W = findRegModel(DataPts, W)
%     xMin = min(DataPts (2, :)) - 1;
%     xMax = max(DataPts (2, :)) + 1;
%     xrange = xMin:0.01:xMax; alpha = 0.005;
%     Data = DataPts(1:end-1,:); 
%     predY = DataPts (end,:);
%     for i = 1:100
%         y = (W(1)+W(2)*xrange);
%         clf; 
%         plot (DataPts(2, predY == -1), DataPts (3, predY == -1), 'bo', DataPts(2, predY == 1), DataPts (3, predY == 1), 'rx');
%         hold on;
%         plot (xrange, y, '-.r');
%         pause (0.01);

%         hThetaX = 1./(1+exp(-1*W' *Data));
%         gradJ = mean(repmat((hThetaX - predY), size(Data,1),1).*Data, 2);
%         W = W - alpha*gradJ;

%         if (max(abs(alpha*gradJ))<0.05)
%             %if gradient is almost zero return;
%             return;
%         end
%     end
% end

function LogReg()
    clear all; close all;
    Datapoints = [-1 -1;-2 -2;-2 -1;-1 -2;1 2;2 1;1 1;2 2];
    Datapoints = Datapoints';
    Datapoints = [ones(1,size(Datapoints,2));Datapoints;-1 -1 -1 -1 1 1 1 1];
    RegMDl = [0 ;1;-1];  %y=-x
    W = findRegModel(Datapoints,RegMDl);
end

function W = findRegModel(Datapts,W)
    xmin = min(Datapts(2,:))-1;
    xmax = max(Datapts(2,:))+1;
    xrange = xmin:0.01:xmax; alpha = 0.05;
    Data = Datapts(1:end-1,:); predY = Datapts(end,:);

   for i = 1:100
       y = (W(1)+W(2)*xrange);
       clf;
       plot(Datapts(2,predY == -1),Datapts(3,predY == 1),'bo', ...
           Datapts(2,predY == 1),Datapts(3,predY == 1),'rx');
       hold on;
       plot(xrange,y,'-.r');
       pause(0.01);

       hthetax = 1./(1+exp(-1*W'*Data));
       gradj = mean(repmat((hthetax-predY),size(Data,1),1).*Data,2);
       W=W-alpha*gradj;  %apply gradient descent

        if(max(abs(alpha*gradj))<0.01)
            %if gradient is almost zero
            return;
        end
    end
end

