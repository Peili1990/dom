package org.nv.dom.util;

import java.util.List;

import org.apdplat.word.WordSegmenter;
import org.apdplat.word.dictionary.DictionaryFactory;
import org.apdplat.word.segmentation.Word;
import org.apdplat.word.util.WordConfTools;

/**
 * <p>文本工具类（主要用于nv文本处理）</p>
 * 2016年8月10日上午3:27:27
 * @author: jack3173
 */
public class TextUtil {
	
	/**
	 * <p>统计字数</p>
	 * 
	 */
	
	public static Integer wordCount(String content){
		WordConfTools.set("dic.path", "classpath:nv_dict.txt");
        DictionaryFactory.reload();
        List<Word> words = WordSegmenter.segWithStopWords(content);
        return words.size();
	}

}
