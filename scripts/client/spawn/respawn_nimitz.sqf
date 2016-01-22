private [ "_nimitz_z", "_spread", "_rotation", "_posx", "_posy" ];

_nimitz_z = 17.5;
_spread = 6;

_nimitz_z = _nimitz_z + (getposasl nimitz select 2);

_rotation = (getdir nimitz);
_posx = (getmarkerpos "spawn_nimitz" select 0);
_posy = (getmarkerpos "spawn_nimitz" select 1);
_posx = (_posx + (random _spread)) - (_spread / 2);
_posy = (_posy + (random _spread)) - (_spread / 2);
player setposasl [ _posx , _posy, _nimitz_z ];