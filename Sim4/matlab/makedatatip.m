function varargout = makedatatip(fig,index, title, labels)
%MAKEDATATIP  Adds data tips to specified data points of graphical objects.
%
%  MAKEDATATIP(HOBJ,INDEX) adds a datatip to the graphical object HOBJ at
%  the data point defined by INDEX.
%
%  HOUT = MAKEDATATIP(...) returns handles to the created datatips.
%
%  If HOBJ is 1-dimensional, INDEX can be of any size and is assumed to be
%  a linear index into the data contained by HOBJ.  HOUT will be of the
%  same size as INDEX.
%
%  If HOBJ is 2-dimensional and INDEX is N-by-2, INDEX is assumed to be a
%  set of N subscripts, and HOUT will be N-by-1.  If INDEX is of any other
%  size, it is assumed to a linear index and HOUT will be the same size as
%  INDEX.  Note that if you wish to specify 2 linear indices, ensure INDEX
%  is a column vector, else it will be assumed to be a single set of
%  subscripts.
%
% Example:
%     x = 1:10;
%     y = rand(1,10);
%     hPlot = plot(x,y);
%     makedatatip(hPlot,[3 8])
%
% Example:
%     [X,Y,Z] = peaks(30);
%     hObj = surf(X,Y,Z);
%     makedatatip(hObj,[5 8; 20 12; 22 28])
%
% Example: Add a single data tip to data point (5,25)
%     [X,Y,Z] = peaks(30);
%     hObj = surf(X,Y,Z);
%     makedatatip(hObj,[5 25])
%
% Example: Add two data tips to data points (5) and (25)
%     [X,Y,Z] = peaks(30);
%     hObj = surf(X,Y,Z);
%     makedatatip(hObj,[5; 25])
%
% Example: Add two data tips to an image
%     load mandrill
%     figure
%     hObj = image(X);
%     colormap(map) 
%     makedatatip(hObj, [103 348; 270 348])

% Author: Tim Farajian
% Release: 2.0
% Release date: 6/27/2012

% Check # of inputs

% Get handle to datacursor mode object
hDataCursorMgr = datacursormode(fig);
set(hDataCursorMgr, 'enable','on', 'NewDataCursorOnClick',false, 'SnapToData', 'off');

% Loop through each specified data point
for n = 1:size(index,1)
  
    pos = [index(n,:)];
%   % Create position vector
%   if isImage && isLinear
%     [i j] = ind2sub([X(2) Y(2)], index(n));
%     pos = [i j 1];
%   elseif isImage
%     pos = [index(n, 1) index(n, 2) 1];
%   elseif isempty(Z)
%     pos = [X(index(n)) Y(index(n))];
%   elseif isLinear
%     pos = [X(index(n)) Y(index(n)) Z(index(n))];
%   else
%     pos = [...
%       X(index(n,1),index(n,2))...
%       Y(index(n,1),index(n,2))...
%       Z(index(n,1),index(n,2))];
%   end
  
  % Create datatip
  hDatatip(n) = createDatatip(hDataCursorMgr, hDataCursorMgr.Figure.Children(2));
  % Specify data cursor properties
    set(get(hDatatip(n),'DataCursor'),'DataIndex',index(n, :),...
      'TargetPoint',pos, 'UpdateFcn', {@myfunction, title(n), labels})
  set(hDatatip(n),'OrientationMode','auto');
%   set(hDatatip(n),'Orientation','bottom-right');
   set(hDatatip(n),'FontSize', 14);
  % Specify datatip properties
  set(hDatatip(n),'Position',pos)
  
end

% Update all data cursors
updateDataCursors(hDataCursorMgr)

% Return handles if requested
if nargout==1
  varargout = {hDatatip};
end

function output_text = myfunction(obj, event_obj, str, labels)
pos = get(event_obj, 'Position');
output_text = {[char(str), ''], [char(labels(1)),num2str(pos(2))]};
set(0,'ShowHiddenHandles','on');                       % Show hidden handles
hText = findobj('Type','text','Tag','DataTipMarker');  % Find the data tip text
set(0,'ShowHiddenHandles','off');                      % Hide handles again
set(hText,'Interpreter','tex');                        % Change the interpreter
