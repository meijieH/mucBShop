package com.tld;

import java.io.IOException;
import java.util.*;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.DAO.*;
import com.ORM.Book;


public class SlidebookTag extends SimpleTagSupport {

	BaseDAO dao=null;
	Book obj=null;
	String hql=null;
	int number; //�������������
	int height; //�õ�����ĸ߶�
	int width; //�õ�����Ŀ��
	
	String baseurl=""; //����url
	String slideno="1";//�ڱ�ҳ�е�ǰ�õ��������
	
	/**��ǩ�崦��**/
	public void doTag() throws JspException,IOException{
		//ʹ��WebApplicationContextUitls�������ȡSpring IoC�����е�daoʵ��
		dao=(BaseDAOImpl)WebApplicationContextUtils.getRequiredWebApplicationContext(
				((PageContext)getJspContext()).getServletContext()).getBean("dao");
		//�����ѯ�鼮�б��HQL���
		hql="from Book as a order by a.id desc";
		
		StringBuffer sb=new StringBuffer();
		List list=dao.query(hql, 1, number);
		
		if(list==null||list.size()==0)
		{
			//��������������ҳ����
			getJspContext().getOut().println("");
			return;
		}
		
		Iterator it=list.iterator();
		sb.append("<script language=javascript>\n");
		sb.append("var focus_width"+slideno+"="+width+"; /*�õ�Ƭ�鼮ͼƬ���*/\n");
		sb.append("var focus_height"+slideno+"="+height+"; /*�õ�Ƭ�鼮ͼƬ���*/\n");
		sb.append("var text_height"+slideno+"=20; /*�õ�Ƭ�鼮���ֱ�����*/\n");
		sb.append("var swf_height"+slideno+" = focus_height"+slideno+"+text_height"+slideno+";\n");
		sb.append("	var pics"+slideno+" = '';\n");
		sb.append("	var links"+slideno+" = '';\n");
		sb.append("	var texts"+slideno+" = '';\n");
		sb.append("	function ati"+slideno+"(url, img, title)\n");
		sb.append("	{\n");
		sb.append("		if(pics"+slideno+" != '')\n");
		sb.append("		{\n");
		sb.append("			pics"+slideno+" = \"|\" + pics"+slideno+";\n");
		sb.append("			links"+slideno+" = \"|\" + links"+slideno+";\n");
		sb.append("			texts"+slideno+" = \"|\" + texts"+slideno+";\n");
		sb.append("		}");
		sb.append("		pics"+slideno+" = escape(img) + pics"+slideno+";\n");
		sb.append("		links"+slideno+" = escape(url) + links"+slideno+";\n");
		sb.append("		texts"+slideno+" = title + texts"+slideno+";\n");
		sb.append("	}\n");
		sb.append("</script>\n");
		
		sb.append("    <script language=javascript>	\n");
		while(it.hasNext()){
			obj=(Book)it.next();
			
			sb.append("      ati"+slideno+"('"+baseurl+obj.getId()+"', '"+baseurl+"/bookPics/"+obj.getPic().trim()+"', '"+obj.getName()+"');\n");
		}		
		sb.append("	document.write('<embed src=\""+baseurl+"/js/pixviewer.swf\" wmode=\"opaque\" FlashVars=\"pics='+pics"+slideno+"+'&links='+links"+slideno+"+'&texts='+texts"+slideno+"+'&borderwidth='+focus_width"+slideno+"+'&borderheight='+focus_height"+slideno+"+'&textheight='+text_height"+slideno+"+'\" menu=\"false\" bgcolor=\"#DADADA\" quality=\"high\" width=\"'+ focus_width"+slideno+"+'\" height=\"'+ swf_height"+slideno+" +'\" allowScriptAccess=\"sameDomain\" type=\"application/x-shockwave-flash\"/>');	\n");
		sb.append("</script>\n");
    	//�����������ҳ����
    	getJspContext().getOut().println(sb);
	}

	
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	

	public String getBaseurl() {
		return baseurl;
	}

	public void setBaseurl(String baseurl) {
		this.baseurl = baseurl;
	}

	public String getSlideno() {
		return slideno;
	}

	public void setSlideno(String slideno) {
		this.slideno = slideno;
	}
	
	
}
