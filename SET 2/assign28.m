function mainTestHierarchicalClustering()
    Datapoints = [0 1; 1 0; 1 1; 0 1; 5 5; 6 5; 6 6];
    HierarchicalClustering(Datapoints);
end

function HierarchicalClustering(Data)
    [m, n] = size(Data);
    DistanceMeasure = zeros(m, m);
    for i = 1:m
        for j = 1:m
            DistanceMeasure(i, j) = norm(Data(i, :) - Data(j, :));
        end
    end
    %single linkage
    SingleLinkage = linkage(DistanceMeasure, 'single');
    figure;
    dendrogram(SingleLinkage);
    title('Single Linkage');
    %complete linkage
    CompleteLinkage = linkage(DistanceMeasure, 'complete');
    figure;
    dendrogram(CompleteLinkage);
    title('Complete Linkage');
    %Tanimoto Similarity Measure
    TanimotoSimilarity = zeros(m, m);
    for i = 1:m
        for j = 1:m
            TanimotoSimilarity(i, j) = 1 - (norm(Data(i, :) - Data(j, :)) / (norm(Data(i, :)) + norm(Data(j, :)) - norm(Data(i, :) - Data(j, :))));
        end
    end
    %single linkage
    SingleLinkage = linkage(TanimotoSimilarity, 'single');
    figure;
    dendrogram(SingleLinkage);
    title('Single Linkage using Tanimoto Similarity Measure');
    %complete linkage
    CompleteLinkage = linkage(TanimotoSimilarity, 'complete');
    figure;
    dendrogram(CompleteLinkage);
    title('Complete Linkage using Tanimoto Similarity Measure');
end
