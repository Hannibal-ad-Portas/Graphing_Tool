/* ===================================================
    This function creates a random disorganised graph. 
    
    Arguments:
    
      num:    The number of nodes to create
      r:      The radius of the elipeses to draw

   =================================================== */


void randomGraph (int size, float r) {
  String alp = "abcdefghijklmnopqrstuvwxyz";
  for(int i = 0; i < size; i++) {
    nodes.add(new Node(random(25, width - 25), random(25, height - 25), r, i, alp.charAt(i)));
  }
  
  
  // this section randomly connects nodes.
  
  for (int i = 0; i < nodes.size(); i++) {
    Node node = nodes.get(i);
    // limit the degree of the nodes
    int x = (int)(random(1, NUMNODES-1));
    x = x - node.edges.size();
    for(int j = 0; j < x; j++) {
      int E;
      boolean goodE;
      //check to make sure the new edge doesn't already exist
      do {
         goodE = true;
         E = (int)(random(nodes.size()));
         
         if( E == node.index)
           goodE = false;
         
         for (Edge adj : node.edges) {
          if (E == adj.adjacent) 
            goodE = false;
         }
         
      } while(goodE == false);
      
      //add the edd to both nodes to prevent duplication      
      node.addEdge(i, E);
      node = nodes.get(E);
      node.addEdge(E, i);
      
    }
  }
  
}