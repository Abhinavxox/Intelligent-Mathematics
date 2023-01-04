%with built in function

% function mainTestFCM ()
%     Datapoints = [0 1; 1 0; 1 1; 0 1; 5 5; 6 5; 6 6];
%     K = 2;
%     [C, U] = fcm(Datapoints, K);
%     [m, n] = size(Datapoints);
%     for i = 1:m
%         [~, classLbl] = max(U);
%     end
%     visualiseClusters(Datapoints, classLbl);
% end

% function visualiseClusters(Data,classLbl)
%     ColorList = {'xr','xb','xk','ob','or','ok'};
%     for i = 1:length(classLbl)
%         scatter(Data (i, 1), Data(i, 2), ColorList{classLbl(i)});
%         hold on;
%     end
%     hold off;
% end

%now perform fuzzy c means without using built in function and initially assume all samples have equal chance to belong to all clusters

% function mainTestFCM ()
%     Datapoints = [0 1; 1 0; 1 1; 0 1; 5 5; 6 5; 6 6];
%     K = 2;
%     FCM(Datapoints, K);
% end

% function FCM(Data,K)
%     [m, n] = size(Data);
%     currCent = Data(1:K, :);
%     newCent = zeros(K, n);
%     for i = 1: 1000
%         for j = 1:K
%             DistanceMeasure( :,j) = sum((Data - currCent(j, :)).^2, 2);
%         end
%         [~, minPos] = sort (DistanceMeasure,2);
%         classLbl = minPos ( :, 1);
%         for j = 1:K
%             newCent(j, :) = mean(Data(classLbl==j,:), 1);
%         end
%         if (norm(currCent - newCent) == 0) 
%             break;
%         else
%             currCent = newCent;
%         end
%         visualiseClusters(Data, classLbl);
%     end
% end

% function visualiseClusters(Data,classLbl)
%     ColorList = {'xr','ob','or','ok'};
%     for i = 1:length(classLbl)
%         scatter(Data (i, 1), Data(i, 2), ColorList{classLbl(i)}); 
%         hold on;
%     end
%     hold off;
% end
