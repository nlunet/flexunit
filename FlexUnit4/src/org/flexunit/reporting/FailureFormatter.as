package org.flexunit.reporting {
	import flash.utils.getQualifiedClassName;
	
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.AssertionError;
	import org.hamcrest.AssertionError;

	public class FailureFormatter {
		//Determines if this is a failure or Error for reporting purposes
		//This will eventually need to be dynamic, but this will get us started
		public static function isError( error:Error ):Boolean {
			var failure:Boolean = 
			   ( ( error is org.flexunit.AssertionError ) ||
				 ( error is org.hamcrest.AssertionError ) ||
				 ( error is flexunit.framework.AssertionFailedError ) ||
				 ( getQualifiedClassName( error ) == "net.digitalprimates.fluint.assertion::AssertionFailedError" ) );

			return !failure;
		}

		public static function xmlEscapeMessage( message:String ):String {
			var escape:XML = <escape/>;
			var escaped:String = '';
			
			if ( message ) {
				escape.setChildren( message );
				escaped = escape.children()[0].toXMLString();
			}

			return escaped;
		}
		
	}
}