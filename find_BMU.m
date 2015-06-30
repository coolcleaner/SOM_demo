function BMU=find_BMU(Network,input)




num_node=numel(Network);


distance=zeros(num_node,1);

for ii=1:num_node
    
    node_weight=Network(ii).weight;
    distance(ii,1)=norm(node_weight-input);
    
end


BMU_candidate_index=find(distance==min(distance));


BMU_index=BMU_candidate_index( ceil(length(BMU_candidate_index)* rand(1,1)) );





BMU=Network(BMU_index);

