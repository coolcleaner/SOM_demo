function disp_network(Network, grid_width,grid_height)


[num_node_width,num_node_height]= size(Network);


for ii=1:num_node_width
    
    
    for jj=1:num_node_height
        
        Node=Network(ii,jj);
        
        x_coord=Node.coord(1,1);
        y_coord=Node.coord(1,2);
        
        rand_color=Node.weight;
        
       rectangle('Position',[x_coord,y_coord,grid_width,grid_height],'FaceColor',rand_color,'EdgeColor','none');
       hold on; 
        
    end
    
    
    
end

daspect([1, 1 , 1])