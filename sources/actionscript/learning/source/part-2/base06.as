﻿package{	import flash.display.MovieClip;		import flash.display.Loader;		import flash.net.URLRequest;		import flash.events.Event;		import flash.events.ProgressEvent;			public class base06 extends MovieClip	{		public function base06():void		{			init();		}				private function init():void		{			var ld:Loader = new Loader();						ld.load( new URLRequest( "death_note.jpg" ) );						ld.contentLoaderInfo.addEventListener( Event.COMPLETE, onLoaded );						ld.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, onLoading );						addChild( ld );		}				private function onLoaded( evt:Event ):void		{					}				private function onLoading( evt:ProgressEvent ):void		{			var percent:Number = ( evt.bytesLoaded / evt.bytesTotal ) * 100;						trace( Math.floor( percent ) );		}	}}