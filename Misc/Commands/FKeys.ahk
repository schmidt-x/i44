class FKeys {
	/**
	 * @param {CommandRunner.ArgsIter} args
	 */
	static Handle(args, _, &output) {
		if not args.Next(&arg) {
			output := this._GetUsage()
			return
		}
		
		switch arg.Value {
			case "on":
				SetFilterKeys(true)
				output := this._GetOutputValues()
			
			case "off":
				SetFilterKeys(false)
				output := this._GetOutputValues()
			
			case "st", "status":
				output := this._GetOutputValues()
				
			case "set":
				this._SetOptions(args, &output)
			
			case "-h", "--help":
				output := this._GetUsage()
			
			default: 
				output := Format("Invalid command '{}'.", arg.Value)
		}
	}
	
		
	static _SetOptions(args, &output) {
		state := waitMs := delayMs := repeatMs := bounceMs := unset
		
		if not args.Next(&arg) {
			output := this._GetHelpForSet()
			return
		}
			
		if arg.Value == "-h" || arg.Value == "--help" {
			output := this._GetHelpForSet()
			return
		}
		
		loop {
			switch option := arg.Value {
				case "-s", "--state":
					if not args.Next(&next) {
						output := Format("[{}] Value is missing.", option)
						return
					}
					switch next.Value {
						case "on":  state := true
						case "off": state := false
						default:
							output := Format("[{}] Invalid argument '{}'.", option, next.Value)
							return
					}
				
				case "-w", "--wait-ms":
					if not this._TryGetValue(args, option, &output, &value) {
						return
					}
					waitMs := value
				
				case "-d", "--delay-ms":
					if not this._TryGetValue(args, option, &output, &value) {
						return
					}
					delayMs := value
					
				case "-r", "--repeat-ms":
					if not this._TryGetValue(args, option, &output, &value) {
						return
					}
					repeatMs := value
				
				case "-b", "--bounce-ms":
					if not this._TryGetValue(args, option, &output, &value) {
						return
					}
					bounceMs := value
				
				default:
					output := Format("Invalid option '{}'.", option)
					return
			}
		} until not args.Next(&arg)
		
		SetFilterKeys(state?, waitMs?, delayMs?, repeatMs?, bounceMs?)
		output := this._GetOutputValues()
	}
	
	static _TryGetValue(args, option, &output, &value) {
		if not args.Next(&next) {
			output := Format("[{}] Value is missing.", option)
			return false
		}
		
		if not IsInteger(next.Value) {
			output := Format("[{}] Value must be Integer.", option)
			return false
		}
		
		value := Integer(next.Value)
		return true
	}
	
	static _GetOutputValues() {
		onBitMask := 0x01 | 0x02 ; FKF_FILTERKEYSON | FKF_AVAILABLE
			
		fKeys := GetFilterKeys()
		state := fKeys.Flags & onBitMask == onBitMask
			
		return Format("
		(
			State:  {}
			Wait:   {}ms
			Delay:  {}ms
			Repeat: {}ms
			Bounce: {}ms
		)", state, fKeys.WaitMSec, fKeys.DelayMSec, fKeys.RepeatMSec, fKeys.BounceMSec)
	}
	
	static _GetUsage() => "
		(
			Usage: fkeys [OPTIONS] COMMAND
			
			Commands:
			on:          Enable FilterKeys
			off:         Disable FilterKeys
			st, status:  Show FilterKeys values
			set:         Set FilterKeys values
			
			Global Options:
			-h, --help:  Print usage
		)"
	
	static _GetHelpForSet() => Format("
		(
			Usage: fkeys set [OPTIONS]
			
			Options:
			-s, --state  string:  Turn on/off FilterKeys ('on', 'off')
			-w, --wait-ms   u32:  Set WaitMs
			-d, --delay-ms  u32:  Set DelayMs
			-r, --repeat-ms u32:  Set RepeatMs
			-b, --bounce-ms u32:  Set BounceMs
		)")
}
