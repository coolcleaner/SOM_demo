close all
clear all

%% I am adding a line



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Initialize %%%%%%%%%%%%%%%%%%%%

map_height=40;
map_width=40;

grid_height=1;
grid_width=1;


num_grid_height=floor(map_height/grid_height);
num_grid_width=floor(map_width/grid_width);



num_node_height=num_grid_height;
num_node_width=num_grid_width;
num_node=num_node_height*num_node_width;



Node= struct('index', 0,  'coord',[0,0], 'weight', []);  %Node

for ii=1:num_node_width
    
    
    for jj=1:num_node_height
        
        Node.index=(jj-1)*num_node_width + ii;
        
        x_coord=(ii-1)*grid_width;
        y_coord=(jj-1)*grid_height;
        Node.coord=[x_coord,y_coord];
        
        rand_color=rand(1,3);
        Node.weight=rand_color;
        
       Network(ii,jj)=Node;
       
    end
     
end


% Network = ini_Network(Network, [5,2], 1, [1,1,1]);
% 
% Network = ini_Network(Network, [15,2], 1, [0,0,0]);
% 
% Network = ini_Network(Network, [5,7], 1, [0,1,0]);
% 
% Network = ini_Network(Network, [15,7], 1, [0,0,1]);
% 
% Network = ini_Network(Network, [5,13], 1, [0,1,1]);
% 
% Network = ini_Network(Network, [15,13], 1, [1,0,0]);
% 
% Network = ini_Network(Network, [5,18], 1, [1,1,0]);
% 
% Network = ini_Network(Network, [15,18], 1, [1,0,1]);

disp_network(Network, grid_width,grid_height)






num_iteration=500;                          %number of iterations for training
sigma_0=max(map_height,map_width)/2;       %initial radius of the neighborhood region
lambda=num_iteration / log(sigma_0);        %normalization factor that makes sure the radius of the neighborhood region equals to 1 in the last iteration

start_learning_rate=0.9;                   %initial learning rate 

%data= min(max(floor(2*rand(1000,3)) + sqrt(0.05)*rand(1000,3),0),1)  ;    %the training data set

data=[ 1,1,1 ;  0,0,0; 0,1,0; 0,0,1; 0,1,1; 1,0,0; 1,1,0; 1,0,1  ];


%%%%%%%%%%%%%%%%%%%%%%%%% End of Initializing %%%%%%%%%%%%%%%%%%%%%%%%%


for ii=1:num_iteration

    ii
      
    
% rand_index=ceil(rand(1,1)*length(data));
% input=data(rand_index,:);                    %randomly pick one record from data set for this iteration of training
    
input=  max(  min( data(mod(ii,8)+1,:) + sqrt(0)*rand(1,3), 1),0);  
%input=rand(1,3);




neighborhood_radius=sigma_0*exp(-ii/(lambda));     %calculate the radius of neighborhood for this iteration
learning_rate=start_learning_rate * exp(-ii/(num_iteration));   %calculate the learning rate at this iteration



BMU=find_BMU(Network,input);

BMU_x_coord=BMU.coord(1,1);            %x coordinate of BMU
BMU_y_coord=BMU.coord(1,2);            %y coordinate of BMU

for jj=1:num_node   % for each node in the network, calculate its distance to BMU, if it is BMU's neighbor, change its weight accordingly

    node_x_coord = Network(jj).coord(1,1);
    node_y_coord = Network(jj).coord(1,2);
    
    
    distance_to_BMU= sqrt((BMU_x_coord - node_x_coord)^2 +  (BMU_y_coord - node_y_coord)^2);
    
    
    if  distance_to_BMU < neighborhood_radius     % if this node is a neighbor of BMU
        
        influence_to_this_node= exp(- distance_to_BMU^2 / (2* neighborhood_radius^2));   %calculate the influence to this node
        
        Network(jj).weight= Network(jj).weight + influence_to_this_node * learning_rate * (input - Network(jj).weight);
        
    end
        
end       %next node


% disp_network(Network, grid_width,grid_height)
% 
% viscircles([BMU_x_coord BMU_y_coord], neighborhood_radius, 'LineStyle', '--');
% 
% xlim([0 map_width]);
% ylim([0 map_height]);
% 
% pause(0.01)

end % next iteration

disp_network(Network, grid_width,grid_height)




