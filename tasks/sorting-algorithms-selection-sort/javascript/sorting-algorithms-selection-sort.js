function selectionSort(nums) {
  var len = nums.length;
  for(var i = 0; i < len; i++) {
    var minAt = i;
    for(var j = i + 1; j < len; j++) {
      if(nums[j] < nums[minAt])
        minAt = j;
    }

    if(minAt != i) {
      var temp = nums[i];
      nums[i] = nums[minAt];
      nums[minAt] = temp;
    }
  }
  return nums;
}

var r = 1;

function executeTask(i) {

var a = [16+i,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85];
selectionSort(a);
	return i;
}

for ( var i = 0; i < 1000000000; i++) { 
	r = executeTask(i + r);
}
