function Perceptron ()
    clear all; 
    close all;
    DataPoints = [-1 0; 0 0; 0 -1; 1 2; 2 1; 3 3;];
    DataPoints = DataPoints'; 
    DataLabel = [-1 -1 -1 1 1 1];
    class1Pts = DataPoints (:, DataLabel == -1); 
    class2Pts = DataPoints (:, DataLabel == 1);
    plot (class1Pts (1, :), class1Pts (2, :), 'bo', class2Pts (1, :), class2Pts (2, :), 'rx');
    w = findSepLine (class1Pts, class2Pts);
end

function W = findSepLine (class1Pts, class2Pts)
    class1Pts  = [ones(1, size(class1Pts, 2)); class1Pts];
    class2Pts = [ones(1, size(class2Pts, 2)); class2Pts];
    %x = y line
    W = [0 -1 1];
    %X range for plotting the line
    xMin = min ([class1Pts(2, :), class2Pts(2, :)]);
    xMax = max ([class1Pts(2, :), class2Pts(2, :)]);
    xrange = xMin:0.01:xMax; 
    alpha = 0.2;
    for i = 1:1000
        %Generate Y Points on the boundary
        y = -W(2)/W(3)*xrange - W(1)/W(3);
        clf; 
        plot (class1Pts (2, :), class1Pts (3, :), 'bo', class2Pts (2, :), class2Pts (3, :), 'rx');
        hold on;
        plot (xrange, y,'-.r');
        %pause (1); %Plot the boundary
        
        %Pick misclassified samples from negative class
        predClss1 = class1Pts'*W'; %Predict class for negative class samples
        pickdmcSaC1 = class1Pts(:,predClss1>0); %pick those which are wrongly predicted as positive
        sumdxX1 = sum(pickdmcSaC1, 2); %compute gradient contribution from negative samples
        
        %Pick misclassified samples from positive class
        predClss2 = class2Pts'*W'; %Predict class for positive class samples
        pickdmcSaC2 = class2Pts(:,predClss2<0); % pick those which are predicted as from negative class
        sumdxX2 = sum(pickdmcSaC2, 2); %compute gradient contribution from negative samples
        errCst = sumdxX1 + sumdxX2;%compute gradient for both negative and positive class
        W = W - alpha*errCst; %apply gradient descent
        
        if (isempty (pickdmcSaC1) && isempty (pickdmcSaC2))
            %if no misclassified samples 
            return
        end
    end
end