f = figure(...
'Units','characters',...
'Color',[0.941176470588235 0.941176470588235 0.941176470588235],...
'Colormap',get(0,'defaultfigureColormap'),...
'IntegerHandle','off',...
'InvertHardcopy',get(0,'defaultfigureInvertHardcopy'),...
'MenuBar','none',...
'Name','Ultrasound Data Collection Module',...
'NumberTitle','off',...
'PaperPosition',get(0,'defaultfigurePaperPosition'),...
'Position',[135.8 46.9230769230769 201.8 31.6923076923077],...
'HandleVisibility','callback',...
'CloseRequestFcn','figureCloseRequest;',...
'Tag','figure1');

plotElement = axes(...
'Parent',f,...
'Position',[0.271995043370508 0.117117117117117 0.697026022304833 0.806306306306306],...
'CameraPosition',[0.5 0.5 9.16025403784439],...
'CameraPositionMode',get(0,'defaultaxesCameraPositionMode'),...
'Color',get(0,'defaultaxesColor'),...
'ColorOrder',get(0,'defaultaxesColorOrder'),...
'LooseInset',[0.138803626601834 0.103254597214742 0.101433419439801 0.070400861737324],...
'XColor',get(0,'defaultaxesXColor'),...
'YColor',get(0,'defaultaxesYColor'),...
'ZColor',get(0,'defaultaxesZColor'),...
'Tag','axes1');

plotElementTitle = get(plotElement,'title');

set(plotElementTitle,...
'Parent',plotElement,...
'Units','data',...
'FontUnits','points',...
'BackgroundColor','none',...
'Color',[0 0 0],...
'DisplayName',blanks(0),...
'EdgeColor','none',...
'EraseMode','normal',...
'DVIMode','auto',...
'FontAngle','normal',...
'FontName','Helvetica',...
'FontSize',11,...
'FontWeight','bold',...
'HorizontalAlignment','center',...
'LineStyle','-',...
'LineWidth',0.5,...
'Margin',3,...
'Position',[0.499289772727273 1.01957831325301 1.00005459937205],...
'Rotation',0,...
'String',blanks(0),...
'Interpreter','tex',...
'VerticalAlignment','bottom',...
'ButtonDownFcn',[],...
'CreateFcn', {@local_CreateFcn, [], ''} ,...
'DeleteFcn',[],...
'BusyAction','queue',...
'HandleVisibility','off',...
'HelpTopicKey',blanks(0),...
'HitTest','on',...
'Interruptible','on',...
'SelectionHighlight','on',...
'Serializable','on',...
'Tag',blanks(0),...
'UserData',[],...
'Visible','on',...
'XLimInclude','on',...
'YLimInclude','on',...
'ZLimInclude','on',...
'CLimInclude','on',...
'ALimInclude','on',...
'IncludeRenderer','on',...
'Clipping','off');

plotElementXLabel = get(plotElement,'xlabel');

set(plotElementXLabel,...
'Parent',plotElement,...
'Units','data',...
'FontUnits','points',...
'BackgroundColor','none',...
'Color',[0.15 0.15 0.15],...
'DisplayName',blanks(0),...
'EdgeColor','none',...
'EraseMode','normal',...
'DVIMode','auto',...
'FontAngle','normal',...
'FontName','Helvetica',...
'FontSize',11,...
'FontWeight','normal',...
'HorizontalAlignment','center',...
'LineStyle','-',...
'LineWidth',0.5,...
'Margin',3,...
'Position',[0.499289772727273 -0.0707831325301205 1.00005459937205],...
'Rotation',0,...
'String',blanks(0),...
'Interpreter','tex',...
'VerticalAlignment','top',...
'ButtonDownFcn',[],...
'CreateFcn', {@local_CreateFcn, [], ''} ,...
'DeleteFcn',[],...
'BusyAction','queue',...
'HandleVisibility','off',...
'HelpTopicKey',blanks(0),...
'HitTest','on',...
'Interruptible','on',...
'SelectionHighlight','on',...
'Serializable','on',...
'Tag',blanks(0),...
'UserData',[],...
'Visible','on',...
'XLimInclude','on',...
'YLimInclude','on',...
'ZLimInclude','on',...
'CLimInclude','on',...
'ALimInclude','on',...
'IncludeRenderer','on',...
'Clipping','off');

plotElementYLabel = get(plotElement,'ylabel');

set(plotElementYLabel,...
'Parent',plotElement,...
'Units','data',...
'FontUnits','points',...
'BackgroundColor','none',...
'Color',[0.15 0.15 0.15],...
'DisplayName',blanks(0),...
'EdgeColor','none',...
'EraseMode','normal',...
'DVIMode','auto',...
'FontAngle','normal',...
'FontName','Helvetica',...
'FontSize',11,...
'FontWeight','normal',...
'HorizontalAlignment','center',...
'LineStyle','-',...
'LineWidth',0.5,...
'Margin',3,...
'Position',[-0.0404829545454546 0.495481927710843 1.00005459937205],...
'Rotation',90,...
'String',blanks(0),...
'Interpreter','tex',...
'VerticalAlignment','bottom',...
'ButtonDownFcn',[],...
'CreateFcn', {@local_CreateFcn, [], ''} ,...
'DeleteFcn',[],...
'BusyAction','queue',...
'HandleVisibility','off',...
'HelpTopicKey',blanks(0),...
'HitTest','on',...
'Interruptible','on',...
'SelectionHighlight','on',...
'Serializable','on',...
'Tag',blanks(0),...
'UserData',[],...
'Visible','on',...
'XLimInclude','on',...
'YLimInclude','on',...
'ZLimInclude','on',...
'CLimInclude','on',...
'ALimInclude','on',...
'IncludeRenderer','on',...
'Clipping','off');

plotElementZLabel = get(plotElement,'zlabel');

set(plotElementZLabel,...
'Parent',plotElement,...
'Units','data',...
'FontUnits','points',...
'BackgroundColor','none',...
'Color',[0.15 0.15 0.15],...
'DisplayName',blanks(0),...
'EdgeColor','none',...
'EraseMode','normal',...
'DVIMode','auto',...
'FontAngle','normal',...
'FontName','Helvetica',...
'FontSize',10,...
'FontWeight','normal',...
'HorizontalAlignment','left',...
'LineStyle','-',...
'LineWidth',0.5,...
'Margin',3,...
'Position',[-0.389914772727273 1.09186746987952 1.00005459937205],...
'Rotation',0,...
'String',blanks(0),...
'Interpreter','tex',...
'VerticalAlignment','middle',...
'ButtonDownFcn',[],...
'CreateFcn', {@local_CreateFcn, [], ''} ,...
'DeleteFcn',[],...
'BusyAction','queue',...
'HandleVisibility','off',...
'HelpTopicKey',blanks(0),...
'HitTest','on',...
'Interruptible','on',...
'SelectionHighlight','on',...
'Serializable','on',...
'Tag',blanks(0),...
'UserData',[],...
'Visible','off',...
'XLimInclude','on',...
'YLimInclude','on',...
'ZLimInclude','on',...
'CLimInclude','on',...
'ALimInclude','on',...
'IncludeRenderer','on',...
'Clipping','off');

scopeStatusGroup = uibuttongroup(...
'Parent',f,...
'Title','Scope Status',...
'TitlePosition','centertop',...
'Clipping','on',...
'Position',[0.0241635687732342 0.648648648648648 0.197026022304833 0.291291291291291],...
'Tag','groupScopeStatus',...
'SelectedObject',[],...
'SelectionChangeFcn','scopeStatusGroupSelectionChanged;',...
'OldSelectedObject',[]);

h8 = uicontrol(...
'Parent',scopeStatusGroup,...
'Units','normalized',...%'Callback',mat{1},...
'Position',[0.270700636942675 0.375 0.484076433121019 0.181818181818182],...
'String','Deinitialize Scope',...
'Style','togglebutton',...
'Value',1,...
'Tag','btnDeinitializeScope');

h9 = uicontrol(...
'Parent',scopeStatusGroup,...
'Units','normalized',...%'Callback',mat{2},...
'Position',[0.308917197452229 0.681818181818182 0.410828025477707 0.181818181818182],...
'String','Initialize Scope',...
'Style','togglebutton',...
'Tag','btnInitializeScope');

txtScopeStatus = uicontrol(...
'Parent',scopeStatusGroup,...
'Units','normalized',...
'ForegroundColor',[0.850980392156863 0.325490196078431 0.0980392156862745],...
'Position',[0.152866242038217 0.0625 0.722929936305732 0.1875],...
'String','Scope is currently not initialized',...
'Style','text',...
'Tag','txtScopeStatus');

transducerStatusGroup = uibuttongroup(...
'Parent',f,...
'Title','Transducer Status',...
'TitlePosition','centertop',...
'Clipping','on',...
'Position',[0.0241635687732342 0.220720720720721 0.197645600991326 0.382882882882883],...
'Visible','off',...
'Tag','groupTransducerStatus',...
'SelectedObject',[],...
'SelectionChangeFcn','transducerStatusGroupSelectionChanged;',...
'OldSelectedObject',[]);

h12 = uicontrol(...
'Parent',transducerStatusGroup,...
'Units','normalized',...%'Callback',mat{3},...
'Position',[0.234920634920635 0.291139240506329 0.577777777777778 0.135021097046413],...
'String','Pause Data Collection',...
'Style','togglebutton',...
'Value',1,...
'Tag','btnDontCollectData');

h13 = uicontrol(...
'Parent',transducerStatusGroup,...
'Units','normalized',...%'Callback',mat{4},...
'Position',[0.215873015873016 0.746835443037975 0.619047619047619 0.135021097046414],...
'String','Collect 1D Scan Data',...
'Style','togglebutton',...
'Tag','btnCollect1DScanData');

h14 = uicontrol(...
'Parent',transducerStatusGroup,...
'Units','normalized',...%'Callback',mat{5},...
'Position',[0.244444444444444 0.518987341772152 0.561904761904762 0.135021097046414],...
'String','Collect 2D Scan Data',...
'Style','togglebutton',...
'Tag','btnCollect2DScanData');

txtTransducerStatus = uicontrol(...
'Parent',transducerStatusGroup,...
'Units','normalized',...
'ForegroundColor',[0.850980392156863 0.325490196078431 0.0980392156862745],...
'Position',[0.0285714285714286 0.080168776371308 0.946031746031746 0.109704641350211],...
'String','Transducer is currently not collecting data',...
'Style','text',...
'Tag','txtTransducerStatus');

h16 = uicontrol(...
'Parent',f,...
'Units','normalized',...
'Callback','saveData;',...
'Position',[0.0892193308550186 0.127627627627628 0.0675340768277571 0.048048048048048],...
'String','Save Data...',...
'Tag','btnSaveData');

% f = figure(...
% 'Units','characters',...
% 'Visible',get(0,'defaultfigureVisible'),...
% 'Color',get(0,'defaultfigureColor'),... %'CurrentAxesMode','manual',...
% 'IntegerHandle','off',...
% 'MenuBar','none',...
% 'Name','Ultrasound_DataCollection_gui',...
% 'NumberTitle','off',...
% 'Resize',get(0,'defaultfigureResize'),...
% 'PaperPosition',get(0,'defaultfigurePaperPosition'),... %'ScreenPixelsPerInchMode','manual',... %'ParentMode','manual',...
% 'HandleVisibility','callback',...
% 'CloseRequestFcn','figureCloseRequest;',...
% 'Tag','figure1');
% 
% plotElement = axes(...
% 'Parent',f,...
% 'FontUnits',get(0,'defaultaxesFontUnits'),...
% 'Units',get(0,'defaultaxesUnits'),...
% 'CameraPosition',[0.5 0.5 9.16025403784439],...
% 'CameraPositionMode',get(0,'defaultaxesCameraPositionMode'),...
% 'CameraTarget',[0.5 0.5 0.5],...
% 'CameraTargetMode',get(0,'defaultaxesCameraTargetMode'),...
% 'CameraViewAngle',6.60861036031192,...
% 'CameraViewAngleMode',get(0,'defaultaxesCameraViewAngleMode'),...
% 'Position',[0.271995043370508 0.117117117117117 0.697026022304833 0.806306306306306],...
% 'ActivePositionProperty','position',... %'ActivePositionPropertyMode',get(0,'defaultaxesActivePositionPropertyMode'),...
% 'LooseInset',[0.138803626601834 0.103254597214742 0.101433419439801 0.070400861737324],... %'LooseInsetMode',get(0,'defaultaxesLooseInsetMode'),...
% 'PlotBoxAspectRatio',[1 0.477333333333333 0.477333333333333],...
% 'PlotBoxAspectRatioMode',get(0,'defaultaxesPlotBoxAspectRatioMode'),...
% 'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1],...
% 'XTickMode',get(0,'defaultaxesXTickMode'),...
% 'XTickLabel',{  '0'; '0.1'; '0.2'; '0.3'; '0.4'; '0.5'; '0.6'; '0.7'; '0.8'; '0.9'; '1' },...
% 'XTickLabelMode',get(0,'defaultaxesXTickLabelMode'),...
% 'YTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1],...
% 'YTickMode',get(0,'defaultaxesYTickMode'),...
% 'YTickLabel',{  '0'; '0.1'; '0.2'; '0.3'; '0.4'; '0.5'; '0.6'; '0.7'; '0.8'; '0.9'; '1' },...
% 'YTickLabelMode',get(0,'defaultaxesYTickLabelMode'));
% 
% plotTitleElement = get(plotElement,'title');
% 
% set(plotTitleElement,...
% 'Parent',plotElement,...
% 'Units','data',...
% 'FontUnits','points',...
% 'Position',[0.50000084982978 1.00512104283054 0.499999999999998],...
% 'FontSize',11,...
% 'FontAngle','normal',...
% 'FontWeight','bold',...
% 'HorizontalAlignment','center',...
% 'HorizontalAlignmentMode','auto',...
% 'VerticalAlignment','bottom',...
% 'VerticalAlignmentMode','auto',...
% 'EdgeColor','none',...
% 'LineStyle','-',...
% 'LineWidth',0.5,...
% 'BackgroundColor','none',...
% 'BackgroundColorMode','auto',...
% 'Margin',3,...
% 'Clipping','off',...
% 'Layer','middle',...
% 'FontSmoothing','on',...
% 'IncludeRenderer','on',...
% 'IsContainer','off',...
% 'BusyAction','queue',...
% 'Interruptible','on',...
% 'HitTest','on',...
% 'HitTestMode','auto',...
% 'PickableParts','visible',...
% 'PickablePartsMode','auto',...
% 'XLimInclude','on',...
% 'XLimIncludeMode','auto',...
% 'YLimInclude','on',...
% 'YLimIncludeMode','auto',...
% 'ZLimInclude','on',...
% 'ZLimIncludeMode','auto',...
% 'CLimInclude','on',...
% 'CLimIncludeMode','auto',...
% 'ALimInclude','on',...
% 'ALimIncludeMode','auto',...
% 'Description','Axes Title',...
% 'DescriptionMode','auto',...
% 'Visible','on',...
% 'VisibleMode','auto',...
% 'Serializable','on',...
% 'SerializableMode','auto',...
% 'HandleVisibility','off',...
% 'HandleVisibilityMode','auto',...
% 'TransformForPrintFcnImplicitInvoke','on',...
% 'TransformForPrintFcnImplicitInvokeMode','auto');
% 
% plotXLabelElement = get(plotElement,'xlabel');
% 
% set(plotXLabelElement,...
% 'Parent',plotElement,...
% 'Units','data',...
% 'FontUnits','points',...
% 'DecorationContainer',[],...
% 'DecorationContainerMode','auto',...
% 'Color',[0.15 0.15 0.15],...
% 'ColorMode','auto',...
% 'Position',[0.500000476837158 -0.0670391061452514 0],...
% 'PositionMode','auto',...
% 'Interpreter','tex',...
% 'InterpreterMode','auto',...
% 'Rotation',0,...
% 'RotationMode','auto',...
% 'FontName','Helvetica',...
% 'FontNameMode','auto',...
% 'FontUnitsMode','auto',...
% 'FontSize',11,...
% 'FontSizeMode','auto',...
% 'FontAngle','normal',...
% 'FontAngleMode','auto',...
% 'FontWeight','normal',...
% 'FontWeightMode','auto',...
% 'HorizontalAlignment','center',...
% 'HorizontalAlignmentMode','auto',...
% 'VerticalAlignment','top',...
% 'VerticalAlignmentMode','auto',...
% 'EdgeColor','none',...
% 'EdgeColorMode','auto',...
% 'LineStyle','-',...
% 'LineStyleMode','auto',...
% 'LineWidth',0.5,...
% 'LineWidthMode','auto',...
% 'BackgroundColor','none',...
% 'BackgroundColorMode','auto',...
% 'Margin',3,...
% 'MarginMode','auto',...
% 'Clipping','off',...
% 'ClippingMode','auto',...
% 'Layer','back',...
% 'LayerMode','auto',...
% 'FontSmoothing','on',...
% 'FontSmoothingMode','auto',...
% 'UnitsMode','auto',...
% 'IncludeRenderer','on',...
% 'IsContainer','off',...
% 'IsContainerMode','auto',...
% 'HG1EraseMode','auto',...
% 'BusyAction','queue',...
% 'Interruptible','on',...
% 'HitTest','on',...
% 'HitTestMode','auto',...
% 'PickableParts','visible',...
% 'PickablePartsMode','auto',...
% 'XLimInclude','on',...
% 'XLimIncludeMode','auto',...
% 'YLimInclude','on',...
% 'YLimIncludeMode','auto',...
% 'ZLimInclude','on',...
% 'ZLimIncludeMode','auto',...
% 'CLimInclude','on',...
% 'CLimIncludeMode','auto',...
% 'ALimInclude','on',...
% 'ALimIncludeMode','auto',...
% 'Description','AxisRulerBase Label',...
% 'DescriptionMode','auto',...
% 'Visible','on',...
% 'VisibleMode','auto',...
% 'Serializable','on',...
% 'SerializableMode','auto',...
% 'HandleVisibility','off',...
% 'HandleVisibilityMode','auto',...
% 'TransformForPrintFcnImplicitInvoke','on',...
% 'TransformForPrintFcnImplicitInvokeMode','auto');
% 
% plotYLabelElement = get(plotElement,'ylabel');
% 
% set(plotYLabelElement,...
% 'Parent',plotElement,...
% 'Units','data',...
% 'FontUnits','points',...
% 'DecorationContainer',[],...
% 'DecorationContainerMode','auto',...
% 'Color',[0.15 0.15 0.15],...
% 'ColorMode','auto',...
% 'Position',[-0.0373333333333333 0.500000476837158 0],...
% 'PositionMode','auto',...
% 'Interpreter','tex',...
% 'InterpreterMode','auto',...
% 'Rotation',90,...
% 'RotationMode','auto',...
% 'FontName','Helvetica',...
% 'FontNameMode','auto',...
% 'FontUnitsMode','auto',...
% 'FontSize',11,...
% 'FontSizeMode','auto',...
% 'FontAngle','normal',...
% 'FontAngleMode','auto',...
% 'FontWeight','normal',...
% 'FontWeightMode','auto',...
% 'HorizontalAlignment','center',...
% 'HorizontalAlignmentMode','auto',...
% 'VerticalAlignment','bottom',...
% 'VerticalAlignmentMode','auto',...
% 'EdgeColor','none',...
% 'EdgeColorMode','auto',...
% 'LineStyle','-',...
% 'LineStyleMode','auto',...
% 'LineWidth',0.5,...
% 'LineWidthMode','auto',...
% 'BackgroundColor','none',...
% 'BackgroundColorMode','auto',...
% 'Margin',3,...
% 'MarginMode','auto',...
% 'Clipping','off',...
% 'ClippingMode','auto',...
% 'Layer','back',...
% 'LayerMode','auto',...
% 'FontSmoothing','on',...
% 'FontSmoothingMode','auto',...
% 'UnitsMode','auto',...
% 'IncludeRenderer','on',...
% 'IsContainer','off',...
% 'IsContainerMode','auto',...
% 'HG1EraseMode','auto',...
% 'BusyAction','queue',...
% 'Interruptible','on',...
% 'HitTest','on',...
% 'HitTestMode','auto',...
% 'PickableParts','visible',...
% 'PickablePartsMode','auto',...
% 'XLimInclude','on',...
% 'XLimIncludeMode','auto',...
% 'YLimInclude','on',...
% 'YLimIncludeMode','auto',...
% 'ZLimInclude','on',...
% 'ZLimIncludeMode','auto',...
% 'CLimInclude','on',...
% 'CLimIncludeMode','auto',...
% 'ALimInclude','on',...
% 'ALimIncludeMode','auto',...
% 'Description','AxisRulerBase Label',...
% 'DescriptionMode','auto',...
% 'Visible','on',...
% 'VisibleMode','auto',...
% 'Serializable','on',...
% 'SerializableMode','auto',...
% 'HandleVisibility','off',...
% 'HandleVisibilityMode','auto',...
% 'TransformForPrintFcnImplicitInvoke','on',...
% 'TransformForPrintFcnImplicitInvokeMode','auto');
% 
% plotZLabelElement = get(plotElement,'zlabel');
% 
% set(plotZLabelElement,...
% 'Parent',plotElement,...
% 'Units','data',...
% 'FontUnits','points',...
% 'DecorationContainer',[],...
% 'DecorationContainerMode','auto',...
% 'Color',[0.15 0.15 0.15],...
% 'ColorMode','auto',...
% 'Position',[0 0 0],...
% 'PositionMode','auto',...
% 'Interpreter','tex',...
% 'InterpreterMode','auto',...
% 'Rotation',0,...
% 'RotationMode','auto',...
% 'FontName','Helvetica',...
% 'FontNameMode','auto',...
% 'FontUnitsMode','auto',...
% 'FontSize',10,...
% 'FontSizeMode','auto',...
% 'FontAngle','normal',...
% 'FontAngleMode','auto',...
% 'FontWeight','normal',...
% 'FontWeightMode','auto',...
% 'HorizontalAlignment','left',...
% 'HorizontalAlignmentMode','auto',...
% 'VerticalAlignment','middle',...
% 'VerticalAlignmentMode','auto',...
% 'EdgeColor','none',...
% 'EdgeColorMode','auto',...
% 'LineStyle','-',...
% 'LineStyleMode','auto',...
% 'LineWidth',0.5,...
% 'LineWidthMode','auto',...
% 'BackgroundColor','none',...
% 'BackgroundColorMode','auto',...
% 'Margin',3,...
% 'MarginMode','auto',...
% 'Clipping','off',...
% 'ClippingMode','auto',...
% 'Layer','middle',...
% 'LayerMode','auto',...
% 'FontSmoothing','on',...
% 'FontSmoothingMode','auto',...
% 'UnitsMode','auto',...
% 'IncludeRenderer','on',...
% 'IsContainer','off',...
% 'IsContainerMode','auto',...
% 'HG1EraseMode','auto',...
% 'BusyAction','queue',...
% 'Interruptible','on',...
% 'HitTest','on',...
% 'HitTestMode','auto',...
% 'PickableParts','visible',...
% 'PickablePartsMode','auto',...
% 'XLimInclude','on',...
% 'XLimIncludeMode','auto',...
% 'YLimInclude','on',...
% 'YLimIncludeMode','auto',...
% 'ZLimInclude','on',...
% 'ZLimIncludeMode','auto',...
% 'CLimInclude','on',...
% 'CLimIncludeMode','auto',...
% 'ALimInclude','on',...
% 'ALimIncludeMode','auto',...
% 'Description','AxisRulerBase Label',...
% 'DescriptionMode','auto',...
% 'Visible','off',...
% 'VisibleMode','auto',...
% 'Serializable','on',...
% 'SerializableMode','auto',...
% 'HandleVisibility','off',...
% 'HandleVisibilityMode','auto',...
% 'TransformForPrintFcnImplicitInvoke','on',...
% 'TransformForPrintFcnImplicitInvokeMode','auto');
% 
% scopeStatusGroup = uibuttongroup(...
% 'Parent',f,...
% 'FontUnits','points',...
% 'Units','normalized',...
% 'SelectionChangeFcn','scopeStatusGroupSelectionChanged;',...
% 'TitlePosition','centertop',...
% 'Title','Scope Status',...
% 'Position',[0.0241635687732342 0.648648648648648 0.197026022304833 0.291291291291291],...
% 'ChildrenMode','manual',...
% 'ParentMode','manual',...
% 'Tag','groupScopeStatus');
% 
% btnDeinitializeScope = uicontrol(...
% 'Parent',scopeStatusGroup,...
% 'FontUnits',get(0,'defaultuicontrolFontUnits'),...
% 'Units','normalized',...
% 'String','Deinitialize Scope',...
% 'Style','togglebutton',...
% 'Value',1,...
% 'Position',[0.270700636942675 0.375 0.484076433121019 0.181818181818182],...
% 'Children',[],...
% 'ParentMode','manual',...
% 'Tag','btnDeinitializeScope');
% 
% btnInitializeScope = uicontrol(...
% 'Parent',scopeStatusGroup,...
% 'FontUnits',get(0,'defaultuicontrolFontUnits'),...
% 'Units','normalized',...
% 'String','Initialize Scope',...
% 'Style','togglebutton',...
% 'Value',get(0,'defaultuicontrolValue'),...
% 'Position',[0.308917197452229 0.681818181818182 0.410828025477707 0.181818181818182],...
% 'Children',[],...
% 'ParentMode','manual',...
% 'Tag','btnInitializeScope');
% 
% txtScopeStatus = uicontrol(...
% 'Parent',scopeStatusGroup,...
% 'FontUnits',get(0,'defaultuicontrolFontUnits'),...
% 'Units','normalized',...
% 'String','Scope is currently not initialized',...
% 'Style','text',...
% 'Position',[0.152866242038217 0.0625 0.722929936305732 0.1875],...
% 'Children',[],...
% 'ForegroundColor',[0.850980392156863 0.325490196078431 0.0980392156862745],...
% 'ParentMode','manual',...
% 'Tag','txtScopeStatus');
% 
% transducerStatusGroup = uibuttongroup(...
% 'Parent',f,...
% 'FontUnits','points',...
% 'Units','normalized',...
% 'SelectionChangeFcn','transducerStatusGroupSelectionChanged;',...
% 'TitlePosition','centertop',...
% 'Title','Transducer Status',...
% 'Position',[0.0241635687732342 0.220720720720721 0.197645600991326 0.382882882882883],...
% 'Visible','off',...
% 'ChildrenMode','manual',...
% 'ParentMode','manual',...
% 'Tag','groupTransducerStatus');
% 
% btnDontCollectData = uicontrol(...
% 'Parent',transducerStatusGroup,...
% 'FontUnits',get(0,'defaultuicontrolFontUnits'),...
% 'Units','normalized',...
% 'String','Pause Data Collection',...
% 'Style','togglebutton',...
% 'Value',1,...
% 'Position',[0.234920634920635 0.291139240506329 0.577777777777778 0.135021097046413],...
% 'Children',[],...
% 'ParentMode','manual',...
% 'Tag','btnDontCollectData');
% 
% btnCollect1DScanData = uicontrol(...
% 'Parent',transducerStatusGroup,...
% 'FontUnits',get(0,'defaultuicontrolFontUnits'),...
% 'Units','normalized',...
% 'String','Collect 1D Scan Data',...
% 'Style','togglebutton',...
% 'Value',get(0,'defaultuicontrolValue'),...
% 'Position',[0.215873015873016 0.746835443037975 0.619047619047619 0.135021097046414],...
% 'Children',[],...
% 'ParentMode','manual',...
% 'Tag','btnCollect1DScanData');
% 
% btnCollect2DScanData = uicontrol(...
% 'Parent',transducerStatusGroup,...
% 'FontUnits',get(0,'defaultuicontrolFontUnits'),...
% 'Units','normalized',...
% 'String','Collect 2D Scan Data',...
% 'Style','togglebutton',...
% 'Position',[0.244444444444444 0.518987341772152 0.561904761904762 0.135021097046414],...
% 'Children',[],...
% 'ParentMode','manual',...
% 'Tag','btnCollect2DScanData');
% 
% txtTransducerStatus = uicontrol(...
% 'Parent',transducerStatusGroup,...
% 'FontUnits',get(0,'defaultuicontrolFontUnits'),...
% 'Units','normalized',...
% 'String','Transducer is currently not collecting data',...
% 'Style','text',...
% 'Position',[0.0285714285714286 0.080168776371308 0.946031746031746 0.109704641350211],...
% 'Children',[],...
% 'ForegroundColor',[0.850980392156863 0.325490196078431 0.0980392156862745],...
% 'ParentMode','manual',...
% 'Tag','txtTransducerStatus');
% 
% btnSaveData = uicontrol(...
% 'Parent',f,...
% 'FontUnits',get(0,'defaultuicontrolFontUnits'),...
% 'Units','normalized',...
% 'String','Save Data...',...
% 'Style',get(0,'defaultuicontrolStyle'),...
% 'Position',[0.0892193308550186 0.127627627627628 0.0675340768277571 0.048048048048048],...
% 'Callback','saveData;',...
% 'Children',[],...
% 'ParentMode','manual',...
% 'Tag','btnSaveData');