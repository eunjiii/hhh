package org.honeyrock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Integer bno;
	private String title, writer, content;
	private Date regdate, updatedate;
	
	
}
