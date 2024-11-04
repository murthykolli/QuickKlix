package com.bmf.quickklix.core.dao.util;
import java.io.IOException;
import java.net.InetSocketAddress;

import net.spy.memcached.MemcachedClient;

public class MemcacheClient {
	private static MemcachedClient _client;
	static {
		try {
		_client = new MemcachedClient(new InetSocketAddress("localhost", 11211));	
		} 
                catch (IOException ioe) {
		ioe.printStackTrace();
		}
	}
	
	private MemcacheClient() {		
	}
	
	public static MemcachedClient getInstance() throws IOException {
		return _client;
	}

}
