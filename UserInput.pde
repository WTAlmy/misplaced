int value;
void keyPressed() {

  if (key == 'r') {
    settings();
  }
  
  if (key == 'p') {
    PROGRAM_STATE = 2;
  }
  
  // Interact with item
  if (key == 'f') {
    
    // Destorying a palmtree
    for (Island island : islands) {
      if (player.touching(island)) {
        for (int i = island.palmtrees.size()-1; i >= 0; i--) { // reverse loop to remove palmtree while iterating
          if (player.touching(island.palmtrees.get(i))) {
            WoodInstance woodPiece = new WoodInstance(island.palmtrees.get(i).getPosition(), 5);
            island.palmtrees.remove(i);
            destroyPalmtree.play();
            println("player destroyed a palmtree");
            break;
          }
        }
      }
    }
  }
  
  // enter game from menu screen
  if (key == 'e' && PROGRAM_STATE == 0){
    PROGRAM_STATE = 1;
  }
  
  // Collect Item
  if (key == 'e') {
    // Collecting logs
    for (int i = wood.instances.size() - 1; i >= 0; i--) {
      if (player.touching(wood.instances.get(i))) {
        wood.collect(1);
        wood.instances.remove(i);
        println("total wood count: ", wood.count);
        break;
      }
    }
    
    // Collecting Bottles
    for (int i = bottleArray.size() - 1; i >= 0; i--) {
      if (player.touching(bottleArray.get(i))) {
        bottles.collect(1);
        bottleArray.remove(i);
        println("player touched a bottle");
        break;
      }
    }
  }

  if (key == 'q' && PROGRAM_STATE > 1){
    exit();
  }
}
