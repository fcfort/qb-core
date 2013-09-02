package org.quickbundle.config;

import java.io.File;


/**
 * 全局配置入口类
 * @author Administrator
 */
public class RmBaseConfig {
	
	public enum PageKey {
		RM_PAGE_SIZE("rm_page_size"),
		RM_CURRENT_PAGE("rm_current_page"),
		RM_PAGE_VO("RM_PAGE_VO"),
		RM_ORDER_STR("RM_ORDER_STR");
		private String key;
		PageKey(String key_) {
			this.key = key_;
		}
		public String key() {
			return key;
		}
	}
	
	/**
	 * 配置类的全局唯一单例
	 */
	private static RmBaseConfigVo singleton = new RmBaseConfigVo();
	
	/**
	 * 得到配置类的全局唯一单例
	 * @return the singleton
	 */
	public static RmBaseConfigVo getSingleton() {
		return singleton;
	}
}