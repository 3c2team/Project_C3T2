package com.itwillbs.c3t2.vo;

import lombok.Data;

@Data
public class FavoriteVO {
	private int favorite_num;
    private String member_id;
    private int product_num;
    private String product_main_img_real_file;
    private String product_name;
}
