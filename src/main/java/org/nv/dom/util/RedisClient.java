/**
 * com.rightoo.util.redis
 * RedisClient.java
 * 2015年3月27日 下午3:58:14
 * @author: z```s
 */
package org.nv.dom.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisShardInfo;
import redis.clients.jedis.ScanParams;
import redis.clients.jedis.ScanResult;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

/**
 * <p></p>
 * 2015年3月27日 下午3:58:14
 * @author: z```s
 * @version 1.0 BASE jedis 2.6.2
 */
public class RedisClient {

	//非切片客户端连接
	//private Jedis jedis;
	
	//非切片连接池
	//private JedisPool jedisPool;
	
	//切片客户端连接
	private ShardedJedis shardedJedis;
	
	//切片连接池
	private ShardedJedisPool shardedJedisPool;
	
	/**
	 * Constructor Method
	 * 2015年3月27日 下午4:06:28
	 * @author: z```s
	 */
	public RedisClient(String host, int port, String name) {
		//initialPool();
		initialShardedPool(host, port, name);
		shardedJedis = shardedJedisPool.getResource();
		//jedis = jedisPool.getResource();
	}
	
	/**
	 * <p>初始化非切片池</p>
	 * 2015年3月27日 下午4:13:41
	 * @author: z```s
	 */
	/*private void initialPool() {
		// 池基本配置
		JedisPoolConfig config = new JedisPoolConfig();
		config.setMaxTotal(20);
		config.setMaxIdle(5);
		config.setMaxWaitMillis(10000);
		jedisPool = new JedisPool(config, "192.168.2.98", 6379);
	}*/
	
	/**
	 * <p>初始化切片池</p>
	 * 2015年3月27日 下午4:17:37
	 * @author: z```s
	 */
	private void initialShardedPool(String host, int port, String name) {
		// 池基本配置
		JedisPoolConfig config = new JedisPoolConfig();
		config.setMaxTotal(20);
		config.setMaxIdle(5);
		config.setMaxWaitMillis(10000);
		config.setTestOnBorrow(false);
		// slave链接
		List<JedisShardInfo> shards = new ArrayList<JedisShardInfo>();
		shards.add(new JedisShardInfo(host, port, name));
		shardedJedisPool = new ShardedJedisPool(config, shards);
	}
	
	/**
	 * <p>设置一个key的过期时间（单位：秒）</p>
	 * @param key key值
	 * @param seconds 多少秒后过期
	 * @return 1：设置了过期时间  0：没有设置过期时间/不能设置过期时间
	 * 2015年3月27日 下午4:21:48
	 * @author: z```s
	 */
	public long expire(String key, int seconds) {
		if (key == null || key.isEmpty()) {
			return 0l;
		}
		return shardedJedis.expire(key, seconds);
	}
	
	/**
	 * <p>设置一个key在某个时间点过期</p>
	 * @param key key值
	 * @param unixTimestamp unix时间戳，从1970-01-01 00:00:00开始到现在的秒数
	 * @return 1：设置了过期时间  0：没有设置过期时间/不能设置过期时间
	 * 2015年3月27日 下午4:24:58
	 * @author: z```s
	 */
	public long expireAt(String key, int unixTimestamp) {
		if (key == null || key.isEmpty()) {
			return 0l;
		}
		return shardedJedis.expireAt(key, unixTimestamp);
	}
	
	/**
	 * <p>截断一个List</p>
	 * @param key 列表key
	 * @param start 开始位置 从0开始
	 * @param end 结束位置
	 * @return 状态码
	 * 2015年3月27日 下午4:27:16
	 * @author: z```s
	 */
	public String trimList(String key, long start, long end) {
		if (key == null || key.isEmpty()) {
			return "-";
		}
		return shardedJedis.ltrim(key, start, end);
	}
	
	/**
	 * <p>检查Set长度</p>
	 * @param key
	 * @return
	 * 2015年3月27日 下午4:34:19
	 * @author: z```s
	 */
	public long countSet(String key) {
		if (key == null || key.isEmpty()) {
			return 0l;
		}
		return shardedJedis.scard(key);
	}
	
	/**
	 * <p>添加到Set中</p>
	 * @param key
	 * @param seconds
	 * @param values
	 * @return
	 * 2015年3月27日 下午4:39:38
	 * @author: z```s
	 */
	public boolean addSet(String key, int seconds, String... values) {
		boolean result = addSet(key, values);
		if (result) {
			return expire(key, seconds) == 1;
		}
		return false;
	}
	
	/**
	 * <p>添加到Set中</p>
	 * @param key
	 * @param values
	 * @return
	 * 2015年3月27日 下午4:37:57
	 * @author: z```s
	 */
	public boolean addSet(String key, String... values) {
		if (key == null || key.isEmpty() || values == null) {
			return false;
		}
		shardedJedis.sadd(key, values);
		return true;
	}
	
	/**
	 * <p>判断值是否包含在set中</p>
	 * @param key
	 * @param value
	 * @return
	 * 2015年3月27日 下午4:41:37
	 * @author: z```s
	 */
	public boolean containsInSet(String key, String value) {
		if (key == null || key.isEmpty() || value == null) {
			return false;
		}
		return shardedJedis.sismember(key, value);
	}
	
	/**
	 * <p>获取Set</p>
	 * @param key
	 * @return
	 * 2015年3月27日 下午4:42:20
	 * @author: z```s
	 */
	public Set<String> getSet(String key) {
		return shardedJedis.smembers(key);
	}
	
	/**
	 * <p>从set中删除values</p>
	 * @param key
	 * @param values
	 * @return
	 * 2015年3月27日 下午4:43:59
	 * @author: z```s
	 */
	public boolean removeSetValue(String key, String... values) {
		shardedJedis.srem(key, values);
		return true;
	}
	
	/**
	 * <p>从list中删除value 默认count 1</p>
	 * @param key
	 * @param values 值list
	 * @return
	 * 2015年3月27日 下午5:02:46
	 * @author: z```s
	 */
	public int removeListValue(String key, List<String> values) {
		return removeListValue(key, 1, values);
	}
	
	/**
	 * <p>从list中删除value</p>
	 * @param key
	 * @param count
	 * @param values 值list
	 * @return
	 * 2015年3月27日 下午5:02:08
	 * @author: z```s
	 */
	public int removeListValue(String key, long count, List<String> values) {
		int result = 0;
		if (values != null && !values.isEmpty()) {
			for (String item : values) {
				if (removeListValue(key, count, item)) {
					result++;
				}
			}
		}
		return result;
	}
	
	/**
	 * <p>从list中删除value</p>
	 * @param key
	 * @param count 要删除个数
	 * @param value
	 * @return
	 * 2015年3月27日 下午5:01:50
	 * @author: z```s
	 */
	public boolean removeListValue(String key, long count, String value) {
		shardedJedis.lrem(key, count, value);
		return true;
	}
	
	/**
	 * <p>截取List</p>
	 * @param key
	 * @param start 起始位置
	 * @param end 结束位置
	 * @return
	 * 2015年3月27日 下午5:04:30
	 * @author: z```s
	 */
	public List<String> rangeList(String key, long start, long end) {
		if (key == null || key.isEmpty()) {
			return null;
		}
		return shardedJedis.lrange(key, start, end);
	}
	
	/**
	 * <p>检查List长度</p>
	 * @param key
	 * @return
	 * 2015年3月27日 下午5:05:34
	 * @author: z```s
	 */
	public long countList(String key) {
		if (key == null || key.isEmpty()) {
			return 0;
		}
		return shardedJedis.llen(key);
	}
	
	/**
	 * <p>添加到List中（同时设置过期时间）</p>
	 * @param key
	 * @param seconds
	 * @param values
	 * @return
	 * 2015年3月27日 下午5:10:55
	 * @author: z```s
	 */
	public boolean addList(String key, int seconds, String... values) {
		boolean result = addList(key, values);
		if (result) {
			return expire(key, seconds) == 1;
		}
		return false;
	}
	
	/**
	 * <p>添加到List</p>
	 * @param key
	 * @param values
	 * @return
	 * 2015年3月27日 下午5:10:02
	 * @author: z```s
	 */
	public boolean addList(String key, String... values) {
		if (key == null || key.isEmpty() || values == null) {
			return false;
		}
		shardedJedis.lpush(key, values);
		return true;
	}
	
	/**
	 * <p>添加到List(只新增)</p>
	 * @param key
	 * @param values
	 * @return
	 * 2015年3月27日 下午5:12:20
	 * @author: z```s
	 */
	public boolean addList(String key, List<String> values) {
		if (key == null || key.isEmpty() || values == null || values.isEmpty()) {
			return false;
		}
		for (String item : values) {
			addList(key, item);
		}
		return true;
	}
	
	/**
	 * <p>获取List</p>
	 * @param key
	 * @return
	 * 2015年3月27日 下午5:13:11
	 * @author: z```s
	 */
	public List<String> getList(String key) {
		return shardedJedis.lrange(key, 0, -1);
	}
	
	/**
	 * <p>设置HashSet对象</p>
	 * @param domain 域名
	 * @param key 键值
	 * @param value JSON String or String value
	 * @return
	 * 2015年3月27日 下午5:14:50
	 * @author: z```s
	 */
	public boolean setHSet(String domain, String key, String value) {
		if (value == null) {
			return false;
		}
		shardedJedis.hset(domain, key, value);
		return true;
	}
	
	/**
	 * <p>获得HashSet对象</p>
	 * @param domain 域名
	 * @param key 键值
	 * @return JSON String or String value
	 * 2015年3月27日 下午5:16:07
	 * @author: z```s
	 */
	public String getHSet(String domain, String key) {
		return shardedJedis.hget(domain, key);
	}
	
	/**
	 * <p>删除HashSet对象</p>
	 * @param domain 域名
	 * @param key 键值
	 * @return 删除的记录数
	 * 2015年3月27日 下午5:17:28
	 * @author: z```s
	 */
	public long delHSet(String domain, String key) {
		return shardedJedis.hdel(domain, key);
	}
	/**
	 * <p>删除HashSet对象</p>
	 * @param domain 域名
	 * @param key 键值
	 * @return 删除的记录数
	 * 2015年3月27日 下午5:18:31
	 * @author: z```s
	 */
	public long delHSet(String domain, String... key) {
		return shardedJedis.hdel(domain, key);
	}
	
	/**
	 * <p>删除整个HashSet对象</p>
	 * @param domain
	 * @return
	 * 2015年3月31日 下午3:52:58
	 * @author: z```s
	 */
	public long delAllHSet(String domain) {
		return shardedJedis.del(domain);
	}
	
	
	/**
	 * <p>判断key是否存在</p>
	 * @param domain 域名
	 * @param key 键值
	 * @return
	 * 2015年3月27日 下午5:19:31
	 * @author: z```s
	 */
	public boolean existsHSet(String domain, String key) {
		return shardedJedis.hexists(domain, key);
	}
	
	/**
	 * <p>全局扫描hset</p>
	 * @param domain
	 * @param match field匹配模式
	 * @return
	 * 2015年3月27日 下午5:28:50
	 * @author: z```s
	 */
	public List<Entry<String, String>> scanHSet(String domain, String match) {
		int cursor = 0;
		ScanParams scanParams = new ScanParams();
		scanParams.match(match);
		Jedis jedis = shardedJedis.getShard(domain);
		ScanResult<Entry<String, String>> scanResult;
		List<Entry<String, String>> values = new ArrayList<Entry<String,String>>();
		do {
			scanResult = jedis.hscan(domain, String.valueOf(cursor), scanParams);
			values.addAll(scanResult.getResult());
			cursor = Integer.parseInt(scanResult.getStringCursor());
		} while (cursor > 0);
		return values;
	}
	
	/**
	 * <p>返回 domain指定的哈希集中所有字段的value值</p>
	 * @param domain
	 * @return
	 * 2015年3月27日 下午5:30:02
	 * @author: z```s
	 */
	public List<String> hvals(String domain) {
		return shardedJedis.hvals(domain);
	}
	
	/**
	 * <p>返回 domain指定的哈希集中所有字段的key值</p>
	 * @param domain
	 * @return
	 * 2015年3月27日 下午5:31:05
	 * @author: z```s
	 */
	public Set<String> hkeys(String domain) {
		return shardedJedis.hkeys(domain);
	}
	
	/**
	 * <p>返回 domain指定的哈希key值总数</p>
	 * @param domain
	 * @return
	 * 2015年3月27日 下午5:36:23
	 * @author: z```s
	 */
	public long lenHSet(String domain) {
		return shardedJedis.hlen(domain);
	}
	
	/**
	 * <p>设置排序集合</p>
	 * @param key
	 * @param score
	 * @param value
	 * @return
	 * 2015年3月27日 下午5:38:07
	 * @author: z```s
	 */
	public boolean setSortedSet(String key, long score, String value) {
		shardedJedis.zadd(key, score, value);
		return true;
	}
	
	/**
	 * <p>获得排序集合</p>
	 * @param key
	 * @param startScore
	 * @param endScore
	 * @param orderByDesc
	 * @return
	 * 2015年3月27日 下午5:41:39
	 * @author: z```s
	 */
	public Set<String> getSoredSet(String key, long startScore, long endScore, boolean orderByDesc) {
		Set<String> values = null;
		if (orderByDesc) {
			values = shardedJedis.zrevrangeByScore(key, endScore, startScore);
		} else {
			values = shardedJedis.zrangeByScore(key, startScore, endScore);
		}
		return values;
	}
	
	/**
	 * <p>计算排序长度</p>
	 * @param key
	 * @param startScore
	 * @param endScore
	 * @return
	 * 2015年3月27日 下午5:44:28
	 * @author: z```s
	 */
	public long countSoredSet(String key, long startScore, long endScore) {
		Long count = shardedJedis.zcount(key, startScore, endScore);
		return count == null ? 0l : count;
	}
	
	/**
	 * <p>删除排序集合</p>
	 * @param key
	 * @param value
	 * @return
	 * 2015年3月27日 下午6:02:42
	 * @author: z```s
	 */
	public boolean delSortedSet(String key, String value) {
		return shardedJedis.zrem(key, value) > 0;
	}
	
	/**
	 * <p>获得排序集合</p>
	 * @param key
	 * @param startRange
	 * @param endRange
	 * @param orderByDesc
	 * @return
	 * 2015年3月27日 下午6:06:44
	 * @author: z```s
	 */
	public Set<String> getSoredSetByRange(String key, int startRange, int endRange, boolean orderByDesc) {
		Set<String> values = null;
		if (orderByDesc) {
			values = shardedJedis.zrevrange(key, startRange, endRange);
		} else {
			values = shardedJedis.zrange(key, startRange, endRange);
		}
		return values;
	}
	
	/**
	 * <p>获得排序打分</p>
	 * @param key
	 * @param member
	 * @return
	 * 2015年3月27日 下午6:07:32
	 * @author: z```s
	 */
	public Double getScore(String key, String member) {
		return shardedJedis.zscore(key, member);
	}
	
	/**
	 * <p></p>
	 * @param key
	 * @param seconds
	 * @param value
	 * @return
	 * 2015年3月27日 下午6:08:33
	 * @author: z```s
	 */
	public boolean set(String key, int seconds, String value) {
		shardedJedis.setex(key, seconds, value);
		return true;
	}
	
	/**
	 * <p></p>
	 * @param key
	 * @param value
	 * @return
	 * 2015年3月27日 下午6:09:19
	 * @author: z```s
	 */
	public boolean set(String key, String value) {
		shardedJedis.set(key, value);
		return true;
	}
	
	/**
	 * <p></p>
	 * @param key
	 * @param defaultValue
	 * @return
	 * 2015年3月27日 下午6:11:01
	 * @author: z```s
	 */
	public String get(String key, String defaultValue) {
		String value = shardedJedis.get(key);
		return value == null ? defaultValue : value;
	}
	
	/**
	 * <p></p>
	 * @param key
	 * @return
	 * 2015年3月27日 下午6:12:04
	 * @author: z```s
	 */
	public boolean del(String key) {
		shardedJedis.del(key);
		return true;
	}
	
	/**
	 * <p></p>
	 * @param key
	 * @return
	 * 2015年3月27日 下午6:12:31
	 * @author: z```s
	 */
	public long incr(String key) {
		return shardedJedis.incr(key);
	}
	
	/**
	 * <p></p>
	 * @param key
	 * @return
	 * 2015年3月27日 下午6:12:59
	 * @author: z```s
	 */
	public long decr(String key) {
		return shardedJedis.decr(key);
	}
	
}
