params [ "_scrollAmount" ];
private [ "_maxHeight", "_minHeight" ];

_maxheight = 2;
_minheight = -2;

if ( (heightmodifier >= _minheight && heightmodifier <= _maxheight) && heightmodifierctrl ) then { _scrollAmount = (round _scrollAmount) * 0.001; }
else { 
	_scrollAmount = 0;
	if ( heightmodifier > _maxheight ) then { heightmodifier = _maxheight };
	if ( heightmodifier < _minheight ) then { heightmodifier = _minheight };
};
heightmodifier = heightmodifier + _scrollAmount;