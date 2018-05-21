/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Pagamento;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Negocio;
import br.com.avicultura.chicken_tracker.Models.Pagamento;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author vinic
 */
public class ConsultaPagamento {

    public static List<Pagamento> returnList(String estabelecimento, Negocio negocio) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        List<Pagamento> lista = null;
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Pagamento p where p.negocio=:negocio and p.estabelecimento.sufixoCNPJ =:estabelecimento"
                    + " ORDER BY ano DESC, mes DESC, dia DESC, valor DESC");
            query.setParameter("estabelecimento", estabelecimento);
            query.setParameter("negocio", negocio.getEmpresaCNPJ());
            lista = query.getResultList();
            s.getTransaction().commit();
            return lista;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return lista;
    }

    public static String seteDiasDespesas(String sufixoCNPJ, Negocio negocio) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 6; i >= 0; i--) {
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - i);
                Query query = s.createQuery("from Pagamento p where p.negocio =: negocio and p.estabelecimento.sufixoCNPJ =:estabelecimento and tipo = D"
                        + " and dia =: dia and mes =: mes and ano =:ano");
                query.setParameter("sufixoCNPJ", sufixoCNPJ);
                query.setParameter("negocio", negocio.getEmpresaCNPJ());
                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH + 1));
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + gc.get(Calendar.MONTH + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario + "!";
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String trintaDiasDespesas(String sufixoCNPJ, Negocio negocio) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 29; i >= 0; i--) {
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - 30);
                Query query = s.createQuery("from Pagamento p where p.negocio =: negocio and p.estabelecimento.sufixoCNPJ =:estabelecimento and tipo = D"
                        + " and dia =: dia and mes =: mes and ano =:ano");
                query.setParameter("sufixoCNPJ", sufixoCNPJ);
                query.setParameter("negocio", negocio.getEmpresaCNPJ());
                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH + 1));
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + gc.get(Calendar.MONTH + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario + "!";
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String dozeMesesDespesas(String sufixoCNPJ, Negocio negocio) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 0; i < 12; i++) {
                Query query = s.createQuery("from Pagamento p where p.negocio =: negocio and p.estabelecimento.sufixoCNPJ =:estabelecimento and tipo = D"
                        + " mes =: mes and ano =:ano");
                query.setParameter("sufixoCNPJ", sufixoCNPJ);
                query.setParameter("negocio", negocio.getEmpresaCNPJ());
                query.setParameter("mes", gc.get(Calendar.MONTH + 1));
                query.setParameter("ano", gc.get(Calendar.YEAR));
                gc.add(Calendar.MONTH, -1);
                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.MONTH + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario + "!";
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        mes/ano/somatoria!mes/ano/somatoria...
         */
        return st;
    }

    public static String seteDiasGanhos(String sufixoCNPJ, Negocio negocio) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 6; i >= 0; i--) {
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - i);
                Query query = s.createQuery("from Pagamento p where p.negocio =: negocio and p.estabelecimento.sufixoCNPJ =:estabelecimento and tipo = G"
                        + " and dia =: dia and mes =: mes and ano =:ano");
                query.setParameter("sufixoCNPJ", sufixoCNPJ);
                query.setParameter("negocio", negocio.getEmpresaCNPJ());
                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH + 1));
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + gc.get(Calendar.MONTH + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario + "!";
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String trintaDiasGanhos(String sufixoCNPJ, Negocio negocio) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 29; i >= 0; i--) {
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - 30);
                Query query = s.createQuery("from Pagamento p where p.negocio =: negocio and p.estabelecimento.sufixoCNPJ =:estabelecimento and tipo = G"
                        + " and dia =: dia and mes =: mes and ano =:ano");
                query.setParameter("sufixoCNPJ", sufixoCNPJ);
                query.setParameter("negocio", negocio.getEmpresaCNPJ());
                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH + 1));
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + gc.get(Calendar.MONTH + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario + "!";
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String dozeMesesGanhos(String sufixoCNPJ, Negocio negocio) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 0; i < 12; i++) {
                Query query = s.createQuery("from Pagamento p where p.negocio =: negocio and p.estabelecimento.sufixoCNPJ =:estabelecimento and tipo = D"
                        + " mes =: mes and ano =:ano");
                query.setParameter("sufixoCNPJ", sufixoCNPJ);
                query.setParameter("negocio", negocio.getEmpresaCNPJ());
                query.setParameter("mes", gc.get(Calendar.MONTH + 1));
                query.setParameter("ano", gc.get(Calendar.YEAR));
                gc.add(Calendar.MONTH, -1);
                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.MONTH + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario + "!";
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        mes/ano/somatoria!mes/ano/somatoria...
         */
        return st;
    }

    public static String seteDiasLucros(String sufixoCNPJ, Negocio negocio) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 6; i >= 0; i--) {
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - i);
                Query query = s.createQuery("from Pagamento p where p.negocio =: negocio and p.estabelecimento.sufixoCNPJ =:estabelecimento"
                        + " and dia =: dia and mes =: mes and ano =:ano");
                query.setParameter("sufixoCNPJ", sufixoCNPJ);
                query.setParameter("negocio", negocio.getEmpresaCNPJ());
                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH + 1));
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    if (p.getTipo() == 'D') {
                        somario -= p.getValor();
                    } else {
                        somario += p.getValor();
                    }
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + gc.get(Calendar.MONTH + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario + "!";
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String trintaDiasLucros(String sufixoCNPJ, Negocio negocio) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 29; i >= 0; i--) {
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - 30);
                Query query = s.createQuery("from Pagamento p where p.negocio =: negocio and p.estabelecimento.sufixoCNPJ =:estabelecimento"
                        + " and dia =: dia and mes =: mes and ano =:ano");
                query.setParameter("sufixoCNPJ", sufixoCNPJ);
                query.setParameter("negocio", negocio.getEmpresaCNPJ());
                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH + 1));
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    if (p.getTipo() == 'D') {
                        somario -= p.getValor();
                    } else {
                        somario += p.getValor();
                    }
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + gc.get(Calendar.MONTH + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario + "!";
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String dozeMesesLucros(String sufixoCNPJ, Negocio negocio) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 0; i < 12; i++) {
                Query query = s.createQuery("from Pagamento p where p.negocio =: negocio and p.estabelecimento.sufixoCNPJ =:estabelecimento"
                        + " and mes =: mes and ano =:ano");
                query.setParameter("sufixoCNPJ", sufixoCNPJ);
                query.setParameter("negocio", negocio.getEmpresaCNPJ());
                query.setParameter("mes", gc.get(Calendar.MONTH + 1));
                query.setParameter("ano", gc.get(Calendar.YEAR));
                gc.add(Calendar.MONTH, -1);
                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    if (p.getTipo() == 'D') {
                        somario -= p.getValor();
                    } else {
                        somario += p.getValor();
                    }
                }
                st += gc.get(Calendar.MONTH + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario + "!";
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        mes/ano/somatoria!mes/ano/somatoria...
         */
        return st;
    }
}
