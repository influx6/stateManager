library specs;

import '../lib/statemanager.dart';

main(){
  
  var play = State.create({ 'name':'alex','paused': false},{
    'play': (target,controller){ print('${target['name']} playing song? isPaused: ${target['paused']}'); },
    'pause': (target,controller){ target['paused'] = true; controller.play(); }
  });
  
  var man = StateManager.create(play);
  man.add('play',{
    'play':(target,control){ target.activate(); target.play(); },
    'pause':(target,control){ }
  });
  man.add('pause',{
    'play':(target,control){ },
    'pause':(target,control){ target.pause(); target.deactivate(); }
  });
  
  //no reaction since state is null
  man.play(); man.pause();
  //switching to play state
  man.switchState('play');
 //should get response with play but not pause
  man.play(); 
  //man.pause();
  //switching to pause state
  man.switchState('pause');
  //pause should respond not play
  man.play(); 
  man.pause();

}