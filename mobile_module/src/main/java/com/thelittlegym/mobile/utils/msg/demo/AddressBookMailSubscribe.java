package com.thelittlegym.mobile.utils.msg.demo;

import com.thelittlegym.mobile.utils.msg.utils.ConfigLoader;
import com.thelittlegym.mobile.utils.msg.config.AppConfig;
import com.thelittlegym.mobile.utils.msg.lib.ADDRESSBOOKMail;

public class AddressBookMailSubscribe {

	public static void main(String[] args) {

		AppConfig config = ConfigLoader.load(ConfigLoader.ConfigType.Mail);
		ADDRESSBOOKMail addressbook = new ADDRESSBOOKMail(config);
		addressbook.setAddress("leo@apple.cn", "leo");
		addressbook.subscribe();
	}	
}
