/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.wpsistemas.exspringmvcweb.converter;

import br.com.wpsistemas.exspringmvcweb.modelo.uteis.TipoSexo;
import org.springframework.core.convert.converter.Converter;

/**
 *
 * @author wender
 */
public class TipoSexoConverter  implements Converter<String, TipoSexo> {

	@Override
	public TipoSexo convert(String texto) {
		char tipo = texto.charAt(0);
		return tipo == TipoSexo.FEMININO.getDesc() ? TipoSexo.FEMININO : TipoSexo.MASCULINO;
	}
}
